class FormValidator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Username cannot contain numbers';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^\d{9}$').hasMatch(value)) {
      return 'Phone number must be exactly 9 digits';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!RegExp(r'^\d{6,}$').hasMatch(value)) {
      return 'Password must contain only numbers and be at least 6 digits';
    }
    return null;
  }
} 