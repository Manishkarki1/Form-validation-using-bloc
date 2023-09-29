abstract class LoginEvent {}

class EmailChangedEvent extends LoginEvent {
  final String emailValue;
  EmailChangedEvent(this.emailValue);
}

class PasswordChangedEvent extends LoginEvent {
  final String passwordValue;
  PasswordChangedEvent(this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginSubmittedEvent(this.email, this.password);
}
