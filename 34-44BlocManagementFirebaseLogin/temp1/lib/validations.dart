class Validations {
  static isValidEmail(String email) {
    final RegExp _emailRegularExpression = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    return _emailRegularExpression.hasMatch(email);
  }

  static isValidPassword(String password) {
    return password.length >=3 ;
  }
}