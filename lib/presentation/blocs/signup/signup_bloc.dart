import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svik/domain/usecases/auth/signup_user.dart';
import 'package:svik/presentation/blocs/auth/auth_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUser signupUser;
  SignupBloc({required this.signupUser}) : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) async {
      emit(SignupLoading());
      SignupParams params = SignupParams(event.username, event.email, event.password);
      final result = await signupUser.call(params);
      final state = result.fold((failure) => SignupFailure(message: failure.message), (authResult) => SignupSuccess());
      emit(state);
    });
  }
}
