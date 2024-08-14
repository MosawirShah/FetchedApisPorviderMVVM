import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {super.key,
      required this.label,
      this.fontSize = 18,
      this.fontWeight,
      this.color});

  String label;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? kWhiteColor),
    );
  }
}
