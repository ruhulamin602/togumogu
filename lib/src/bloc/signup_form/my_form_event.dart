part of 'my_form_bloc.dart';

abstract class MySignUpFormEvent extends Equatable {
  const MySignUpFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends MySignUpFormEvent {
  const EmailChanged({@required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends MySignUpFormEvent {}

class PasswordChanged extends MySignUpFormEvent {
  const PasswordChanged({@required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends MySignUpFormEvent {}

class ConfirmPasswordChanged extends MySignUpFormEvent {
  const ConfirmPasswordChanged({@required this.confirmPassword});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class ConfirmPasswordUnfocused extends MySignUpFormEvent {}

class FormSubmitted extends MySignUpFormEvent {}
