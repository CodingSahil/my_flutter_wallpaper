import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/pages/login.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.heightWidth = 20,
    this.color = kPrimaryColor,
  });

  final double? heightWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightWidth,
      width: heightWidth,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 1.5,
      ),
    );
  }
}
