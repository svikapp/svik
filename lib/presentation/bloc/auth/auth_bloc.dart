import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svik/core/usecases/usecase.dart';
import 'package:svik/domain/usecases/auth/verify_session.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final VerifySession verifySession;
  AuthBloc({required this.verifySession}) : super(Uninitialized()) {
    on<AppStarted>((event, emit)async {
      emit(AuthLoading());
      final result = await verifySession.call(NoParams());
      final state = result.fold((l) => UnAuthenticated(), (r) => Authenticated());
      emit(state);
    });
  }
}
