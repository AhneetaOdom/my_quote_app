import 'package:get/get.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  var _isFullNameValid = false.obs;
  var _isEmailValid = false.obs;
  var _isPasswordValid = false.obs;
  var _isConfirmPasswordValid = false.obs;

  bool get isFullNameValid => _isFullNameValid.value;
  bool get isEmailValid => _isEmailValid.value;
  bool get isPasswordValid => _isPasswordValid.value;
  bool get isConfirmPasswordValid => _isConfirmPasswordValid.value;

  var _fullNameErrorText = ''.obs;
  var _emailErrorText = ''.obs;
  var _passwordErrorText = ''.obs;
  var _confirmPasswordErrorText = ''.obs;

  String get fullNameErrorText => _fullNameErrorText.value;
  String get emailErrorText => _emailErrorText.value;
  String get passwordErrorText => _passwordErrorText.value;
  String get confirmPasswordErrorText => _confirmPasswordErrorText.value;

  var _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;

  void fullNameChanged({required String fullName}) {
    if (fullName.isNotEmpty) {
      _isFullNameValid.value = true;
      _fullNameErrorText.value = '';
    } else {
      _isFullNameValid.value = false;
      _fullNameErrorText.value = 'Full name cannot be empty.';
    }
    update();
  }

  void loginEmailChanged({required String email}) {
    if (email.isNotEmpty && email.contains('@')) {
      _isEmailValid.value = true;
      _emailErrorText.value = '';
    } else {
      _isEmailValid.value = false;
      _emailErrorText.value = 'Please enter a valid email address.';
    }
    update();
  }

  void loginPasswordChanged({required String password}) {
    if (password.length >= 8) {
      _isPasswordValid.value = true;
      _passwordErrorText.value = '';
    } else {
      _isPasswordValid.value = false;
      _passwordErrorText.value = 'Password must be at least 8 characters long.';
    }
    update();
  }

  void confirmPasswordChanged({required String password, required String confirmPassword}) {
    if (confirmPassword == password) {
      _isConfirmPasswordValid.value = true;
      _confirmPasswordErrorText.value = '';
    } else {
      _isConfirmPasswordValid.value = false;
      _confirmPasswordErrorText.value = 'Passwords do not match.';
    }
    update();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update();
  }
}

