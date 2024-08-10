import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quote_app/screens/login.dart';
import '../controller/auth_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'landing_page.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final controller = Get.put(AuthController());

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: black,
                    fontSize: AppSizes.fontSizeLg,
                    fontWeight: AppSizes.fontWeightBold,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.fontSizeMd,
                ),
                InputFieldWidget(
                  title: 'Name',
                  controller: _fullNameController,
                  onChanged: (value) {
                    controller.fullNameChanged(fullName: value);
                  },
                ),
                Text(
                  controller.fullNameErrorText,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: AppSizes.fontSizeMd,
                ),
                InputFieldWidget(
                  title: 'Email',
                  controller: _emailController,
                  onChanged: (value) {
                    controller.loginEmailChanged(email: value);
                  },
                ),
                Text(
                  controller.emailErrorText,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: AppSizes.fontSizeMd,
                ),
                InputFieldWidget(
                  title: 'Password',
                  controller: _passwordController,
                  obscureText: controller.isPasswordVisible,
                  isPasswordField: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                    icon: controller.isPasswordVisible
                        ? const Icon(Icons.visibility_off_rounded)
                        : const Icon(Icons.visibility_rounded),
                  ),
                  onChanged: (value) {
                    controller.loginPasswordChanged(password: value);
                  },
                ),
                Text(
                  controller.passwordErrorText,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: AppSizes.fontSizeMd,
                ),
                InputFieldWidget(
                  title: 'Confirm Password',
                  controller: _confirmPasswordController,
                  obscureText: controller.isPasswordVisible,
                  isPasswordField: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                    icon: controller.isPasswordVisible
                        ? const Icon(Icons.visibility_off_rounded)
                        : const Icon(Icons.visibility_rounded),
                  ),
                  onChanged: (value) {
                    controller.confirmPasswordChanged(
                      password: _passwordController.text,
                      confirmPassword: value,
                    );
                  },
                ),
                Text(
                  controller.confirmPasswordErrorText,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: AppSizes.fontSizeXlg,
                ),
                PrimaryButton(
                  title: 'Create Account',
                  isLoading: controller.isAuthLoading,
                  onTap: () {
                    if (controller.isFullNameValid &&
                        controller.isEmailValid &&
                        controller.isPasswordValid &&
                        controller.isConfirmPasswordValid) {
                      controller.registerUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          fullName: _fullNameController.text
                      ).then(
                              (value) {
                            if (value) {
                              Get.to(()=>LandingPage());
                            }
                          }
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: AppSizes.smallDefaultSpace,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have an Account?',
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeXxs,
                          color: black,
                        ),
                      ),
                      Text(
                        ' Login',
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeXxs,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
