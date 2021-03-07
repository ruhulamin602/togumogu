part of 'my_form_bloc.dart';

class MySignUpFormState extends Equatable {
  const MySignUpFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final FormzStatus status;

  MySignUpFormState copyWith({
    Email email,
    Password password,
    ConfirmPassword confirmPassword,
    FormzStatus status,
  }) {
    return MySignUpFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, confirmPassword, status];
}
