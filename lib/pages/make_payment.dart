import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/utils/text-style.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({
    super.key,
    required this.arguments,
  });

  final dynamic arguments;

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CustomText(
                text: widget.arguments.toString(),
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
