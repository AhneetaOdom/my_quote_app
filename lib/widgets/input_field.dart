import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: AppSizes.fontSizeSm, color: black),
        ),
        const SizedBox(
          height: AppSizes.spaceBfrFields,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.smallborderRadius),
            ),
          ),
        ),
      ],
    );
  }
}
