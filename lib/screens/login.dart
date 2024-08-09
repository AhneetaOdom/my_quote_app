import 'package:flutter/material.dart';
import 'package:my_quote_app/screens/create_account.dart';
import 'package:my_quote_app/screens/home_page.dart';
import '../controller/auth_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(AuthController());

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    'Login',
                    style: TextStyle(
                        color: black,
                        fontSize: AppSizes.fontSizeLg,
                        fontWeight: AppSizes.fontWeightBold),
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
                      onPressed: (){
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
                    height: AppSizes.fontSizeXlg,
                  ),
                  PrimaryButton(
                    title: 'Login',
                    // isLoading: true,
                    onTap: (){
    if (controller.isEmailValid && controller.isPasswordValid) {
      Get.to(HomePage());
    }
                    },
                  ),
                  SizedBox(
                    height: AppSizes.smallDefaultSpace,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CreateAccountPage()); // Navigate to CreateAccountPage
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t Have an Account?',
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeXxs,
                            color: black,
                          ),
                        ),
                        Text(
                          ' Create Account',
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeXxs,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              )
          ),
        )),
      ),
    );
  }
}