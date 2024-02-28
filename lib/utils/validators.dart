class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    bool emailValid =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    if (!emailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    bool phoneNumberValid = RegExp(r'^[0-9]{10}$').hasMatch(value);
    if (!phoneNumberValid) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 5) {
      return 'Password must be at least 5 characters long';
    }
    return null;
  }
}