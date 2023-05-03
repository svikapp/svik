import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svik/domain/usecases/auth/login_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  LoginBloc({required this.loginUser}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      LoginParams params = LoginParams(event.email, event.password);
      final result = await loginUser.call(params);
      final state = result.fold((failure) => LoginFailure(message: failure.message), (r) => LoginSuccess());
      emit(state);
    });
  }
}
