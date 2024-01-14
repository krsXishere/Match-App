import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tebak_gambar/widgets/template_page_widget.dart';
import '../../common/theme.dart';

class ExerciseThreePage extends StatefulWidget {
  final String exerciseTitle;
  final List<Widget> children;
  const ExerciseThreePage({
    super.key,
    required this.exerciseTitle,
    required this.children,
  });

  @override
  State<ExerciseThreePage> createState() => _ExerciseThreePageState();
}

class _ExerciseThreePageState extends State<ExerciseThreePage> {
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    audioPlayer.play(
      AssetSource("sounds/alert/kotak.wav"),
    );
    super.initState();
  }
  
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: TemplatepageWidget(
        widgets: [
          Positioned(
            top: 150,
            left: 40,
            child: FittedBox(
              fit: BoxFit.none,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.exerciseTitle,
                  style: primaryTextStyle.copyWith(
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: FittedBox(
              fit: BoxFit.none,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: widget.children,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
