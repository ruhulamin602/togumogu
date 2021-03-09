import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_validation/models/models.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:togumogu/src/repository/authentication_repository.dart';
import 'package:togumogu/src/validator/confirm_password_validator.dart';
import 'package:togumogu/src/validator/email_validator.dart';
import 'package:togumogu/src/validator/password_validator.dart';

part 'my_form_event.dart';
part 'my_form_state.dart';

class MySignUpBloc extends Bloc<MySignUpFormEvent, MySignUpFormState> {
  MySignUpBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const MySignUpFormState());

  final AuthenticationRepository _authenticationRepository;

  @override
  void onTransition(
      Transition<MySignUpFormEvent, MySignUpFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<MySignUpFormState> mapEventToState(MySignUpFormEvent event) async* {
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.password, state.confirmPassword]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.email, password, state.confirmPassword]),
      );
    } else if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email, state.password, state.confirmPassword]),
      );
    } else if (event is PasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.email, password, state.confirmPassword]),
      );
    } else if (event is ConfirmPasswordChanged) {
      final confirmPassword = ConfirmPassword.dirty(event.confirmPassword);
      yield state.copyWith(
        confirmPassword: confirmPassword.valid
            ? confirmPassword
            : ConfirmPassword.pure(event.confirmPassword),
        status: confirmPassword.value==state.password.value? FormzStatus.valid:FormzStatus.invalid,
      );
    } else if (event is ConfirmPasswordUnfocused) {
      final confirmPassword =
          ConfirmPassword.dirty(state.confirmPassword.value);
      yield state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate([state.email, state.password, confirmPassword]),
      );
    } else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
      final confirmPassword =
          ConfirmPassword.dirty(state.confirmPassword.value);
      yield state.copyWith(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        status: Formz.validate([email, password, confirmPassword]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);

        yield state.copyWith(
            status: !_authenticationRepository.isAuth
                ? FormzStatus.submissionFailure
                : FormzStatus.submissionSuccess);
      }
    }
  }
}
