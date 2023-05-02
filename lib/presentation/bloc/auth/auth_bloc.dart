import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:svik/core/usecases/usecase.dart';
import 'package:svik/domain/usecases/auth/verify_session.dart';

import '../login/login_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final VerifySession verifySession;
  final LoginBloc loginBloc;
  late StreamSubscription loginSubscription;
  AuthBloc({required this.verifySession, required this.loginBloc})
      : super(Uninitialized()) {
    /// Listening to the login & signup bloc for navigation
    loginSubscription = loginBloc.stream.listen((state) {
      if (state is LoginSuccess) {
        emit(Authenticated());
      }
    });
    on<AppStarted>((event, emit) async {
      emit(AuthLoading());
      final result = await verifySession.call(NoParams());
      Logger logger = Logger();
      logger.i('Got result for session verification');
      final state = result.fold((l) {
        logger.e('Error verification - ${l.message}');
        return UnAuthenticated();
      }, (r) {
        logger.i('Authenticated');
        return Authenticated();
      });
      emit(state);
    });


    on<LogOut>((event, emit)async{
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(UnAuthenticated());
    });
  }
  
  

  @override
  Future<void> close() {
    loginSubscription.cancel();
    return super.close();
  }
}
