import 'package:email_validator/email_validator.dart';

class UserLogin {
  final String email;
  final String password;

  /// Instantiating this should be inside of try/catch block to catch errors.
  factory UserLogin({required String email, required String password}) {
    return UserLogin._(email.validate(), password);
  }
  const UserLogin._(this.email, this.password);
}

class EmailValidateException implements Exception {
  final String? message;
  EmailValidateException(this.message) : super();
}

extension EmailValidatorExtension on String {
  String validate() {
    bool isEmailCorrect = EmailValidator.validate(this);

    if (this == "") {
      throw EmailValidateException("Email field is empty.");
    }

    if (isEmailCorrect) {
      return this;
    } else {
      throw EmailValidateException("Email field is in wrong format.");
    }
  }
}
