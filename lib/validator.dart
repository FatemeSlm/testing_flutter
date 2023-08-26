class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Required Filed';
    }
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Required Filed';
    }
    if (password.length < 8) {
      return 'Please Enter at least 8 character for password';
    }
    return null;
  }
}
