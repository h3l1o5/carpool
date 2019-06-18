class Validator {
  static bool isEmailValid(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return password.length >= 8;
  }

  static bool isDisplayNameValid(String displayName) {
    final _displayName = displayName.trim();

    return _displayName.length > 0 && _displayName.length <= 8;
  }
}
