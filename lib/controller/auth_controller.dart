import 'package:get/get.dart';

class AuthController extends GetxController {
  var _isEmailValid = false.obs;
  var _isPasswordValid = false.obs;

  bool get isEmailValid => _isEmailValid.value;
  bool get isPasswordValid => _isPasswordValid.value;

  var _emailErrorText = ''.obs;
  var _passwordErrorText = ''.obs;

  String get emailErrorText => _emailErrorText.value;
  String get passwordErrorText => _passwordErrorText.value;

  var _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;

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

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update();
  }
}
