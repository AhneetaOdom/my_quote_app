import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                        color: black,
                        fontSize: AppSizes.fontSizeLg,
                        fontWeight: AppSizes.fontWeightBold),
                  ),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(
                    title: 'Name',
                    controller: _fullNameController,
                  ),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(
                    title: 'Email',
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(
                    title: 'Password',
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(
                    title: 'Confirm Password',
                    controller: _confirmPasswordController,
                  ),
                  SizedBox(
                    height: AppSizes.fontSizeXlg,
                  ),
                  PrimaryButton(
                    title: 'Create Account',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}