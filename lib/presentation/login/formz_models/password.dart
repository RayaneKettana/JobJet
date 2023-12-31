import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty || !_passwordRegExp.hasMatch(value)) {
      return PasswordValidationError.invalid;
    }
    return null;
  }
}
