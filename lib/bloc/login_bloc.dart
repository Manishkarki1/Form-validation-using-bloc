import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/bloc/login_event.dart';
import 'package:formvalidation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<EmailChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(EmailErrorState('Please enter a valid email address'));
      }
    });

    on<PasswordChangedEvent>((event, emit) {
      if (event.passwordValue.length <= 6) {
        emit(PasswordErrorState('please enter a valid password'));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) {
      emit(LoadingState());
    });
  }
}
