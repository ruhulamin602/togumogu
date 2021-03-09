import 'package:formz/formz.dart';
import 'package:togumogu/src/validator/validator.dart';

enum ConFirmPasswordValidationError { invalid }

class ConfirmPassword
    extends FormzInput<String, ConFirmPasswordValidationError> {
  const ConfirmPassword.pure([String value = '']) : super.pure(value);
  const ConfirmPassword.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegex = RegExp(r'^(?=.*[A-Za-z])[A-Za-z\d]{8,}$');

  @override
  ConFirmPasswordValidationError validator(String value) {
    return _passwordRegex.hasMatch(value) 
        ? null
        : ConFirmPasswordValidationError.invalid;
  }
}
