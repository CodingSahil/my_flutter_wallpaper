import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.black,
  });

  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color:color,
        fontFamily: 'Poppins',
      ),
    );
  }
}
