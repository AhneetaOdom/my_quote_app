import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  const EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: Column(
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
                  ),
                const SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(
                    title: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    isPasswordField: true,
                    suffixIcon: const Icon(Icons.visibility_off_rounded),
                  ),
                  const SizedBox(
                    height: AppSizes.fontSizeXlg,
                  ),
              const  PrimaryButton(
                    title: 'Login',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}