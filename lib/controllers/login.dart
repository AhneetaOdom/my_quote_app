import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(left: 16, right: 16),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        color: black,
                        fontSize: AppSizes.fontSizeLg,
                        fontWeight: AppSizes.fontWeightBold),
                  ),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(title: 'Email'),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(title: 'Password'),
                  SizedBox(
                    height: AppSizes.fontSizeXlg,
                  ),
                  PrimaryButton(
                    title: 'Login',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}