import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                  InputFieldWidget(title: 'Name'),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(title: 'Email'),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(title: 'Password'),
                  SizedBox(
                    height: AppSizes.fontSizeMd,
                  ),
                  InputFieldWidget(title: 'Confirm Password'),
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
