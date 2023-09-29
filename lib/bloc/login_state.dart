abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class EmailErrorState extends LoginState {
  final String errorEmail;
  EmailErrorState(this.errorEmail);
}

class PasswordErrorState extends LoginState {
  final String errorPassword;
  PasswordErrorState(this.errorPassword);
}

class LoadingState extends LoginState {}
