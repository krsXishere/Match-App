import 'package:flutter/material.dart';
import 'package:tebak_gambar/common/theme.dart';
import 'package:tebak_gambar/widgets/custom_button_widget.dart';

class AlertCheckAnswerWidget extends StatelessWidget {
  final bool answer;
  final Function() onPressed;

  const AlertCheckAnswerWidget({
    super.key,
    required this.answer,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white.withOpacity(0.8),
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        answer ? "YEAY..." : "YAHH...",
        textAlign: TextAlign.center,
        style: primaryTextStyle.copyWith(
          fontSize: 20,
          fontWeight: bold,
        ),
      ),
      content: SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              answer
                  ? "assets/png/bintang-benar.png"
                  : "assets/png/bintang-salah.png",
              scale: 5,
            ),
            Text(
              answer ? "KAMU BENAR" : "COBA LAGI YAA",
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomButtonWidget(
          text: answer ? "Berikutnya" : "Coba Lagi",
          onPressed: onPressed,
        ),
      ],
    );
  }
}
