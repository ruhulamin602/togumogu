import 'package:formz/formz.dart';

enum ConFirmPasswordValidationError { invalid }

class ConfirmPassword
    extends FormzInput<String, ConFirmPasswordValidationError> {
  const ConfirmPassword.pure([String value = '']) : super.pure(value);
  const ConfirmPassword.dirty([String value = '']) : super.dirty(value);

  @override
  ConFirmPasswordValidationError validator(String value) {
    return value.length>=8 ? null : ConFirmPasswordValidationError.invalid;
  }
}
