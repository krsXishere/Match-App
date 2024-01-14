import 'package:flutter/material.dart';
import '../common/theme.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: primaryTextStyle.copyWith(
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
