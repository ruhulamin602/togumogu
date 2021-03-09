import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final _phoneRegex = RegExp(
    r'^([+][8]{2}|0088)?(01)([3-9])\d{8}$',
  );
  @override
  EmailValidationError validator(String value) {
    if (_emailRegex.hasMatch(value)) {
      return null;
    } else if (_phoneRegex.hasMatch(value)) {
      return null;
    } else {
      return EmailValidationError.invalid;
    }
  }
}
