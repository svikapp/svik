import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svik/domain/usecases/auth/signup_user.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUser signupUser;
  SignupBloc({required this.signupUser}) : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) async {
      emit(SignupLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(SignupSuccess());
    });
  }
}
