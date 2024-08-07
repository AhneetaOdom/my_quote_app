import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 343,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(AppSizes.smallborderRadius)),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: AppSizes.fontSizeMd,
            fontWeight: AppSizes.fontWeightW400,
            color: Colors.white),
      ),
    );
  }
}
