import 'package:flutter/material.dart';

class TemplatepageWidget extends StatelessWidget {
  final List<Widget> widgets;
  const TemplatepageWidget({
    super.key,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/png/background.png",
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 10,
          top: 30,
          child: Image.asset(
            "assets/png/watermark.png",
            scale: 7,
          ),
        ),
        ...widgets,
      ],
    );
  }
}
