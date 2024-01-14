import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tebak_gambar/pages/exercise/exercise_three_page.dart';
import 'package:tebak_gambar/widgets/template_page_widget.dart';

import '../../common/theme.dart';
import '../../widgets/alert_check_answer_widget.dart';
import '../../widgets/navigate_listtile_widget.dart';

class QuizThreePage extends StatefulWidget {
  const QuizThreePage({super.key});

  @override
  State<QuizThreePage> createState() => _QuizThreePageState();
}

class _QuizThreePageState extends State<QuizThreePage> {
  final audioPlayer = AudioPlayer();
  List<String> listImagePath = [
    "assets/png/garis-putus-persegi.png",
    "assets/png/garis-putus-persegi.png",
    "assets/png/garis-putus-persegi.png",
  ];
  List<String> listImagePath2 = [
    "assets/png/garis-putus-persegi.png",
    "assets/png/garis-putus-persegi.png",
  ];

  buildAlert(bool answer, Function() onPressed) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertCheckAnswerWidget(
          answer: answer,
          onPressed: onPressed,
        );
      },
    );
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
                  children: [
                    NavigateListTile(
                      title: "Latihan 1",
                      icons: Icons.play_arrow_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: ExerciseThreePage(
                              exerciseTitle: "Latihan 1",
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/png/baju-dikotak.png",
                                      scale: 5,
                                    ),
                                    DragTarget(
                                      onAccept: (String imagePath) {
                                        listImagePath[0] = imagePath;
                                      },
                                      onWillAccept: (image) {
                                        if (image == "assets/png/b13.png") {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/correct.mp3"),
                                          );
                                          return true;
                                        } else {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/wrong.mp3"),
                                          );
                                          buildAlert(false, () {
                                            Navigator.of(context).pop();
                                          });
                                          return false;
                                        }
                                      },
                                      builder: (context, candidateData,
                                          rejectedData) {
                                        return Image.asset(
                                          listImagePath[0],
                                          scale: 9,
                                        );
                                      },
                                    ),
                                    Draggable(
                                      data: "assets/png/b11.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/b11.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/b11.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/png/jaket-kotak.png",
                                      scale: 5,
                                    ),
                                    DragTarget(
                                      onAccept: (String imagePath) {
                                        listImagePath[1] = imagePath;
                                      },
                                      onWillAccept: (image) {
                                        if (image == "assets/png/b11.png") {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/correct.mp3"),
                                          );
                                          return true;
                                        } else {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/wrong.mp3"),
                                          );
                                          buildAlert(false, () {
                                            Navigator.of(context).pop();
                                          });
                                          return false;
                                        }
                                      },
                                      builder: (context, candidateData,
                                          rejectedData) {
                                        return Image.asset(
                                          listImagePath[1],
                                          scale: 9,
                                        );
                                      },
                                    ),
                                    Draggable(
                                      data: "assets/png/b15.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/b15.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/b15.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/png/celana-dikotak.png",
                                      scale: 5,
                                    ),
                                    DragTarget(
                                      onAccept: (String imagePath) {
                                        listImagePath[2] = imagePath;
                                      },
                                      onWillAccept: (image) {
                                        if (image == "assets/png/b15.png") {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/correct.mp3"),
                                          );
                                          return true;
                                        } else {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/wrong.mp3"),
                                          );
                                          buildAlert(false, () {
                                            Navigator.of(context).pop();
                                          });
                                          return false;
                                        }
                                      },
                                      builder: (context, candidateData,
                                          rejectedData) {
                                        return Image.asset(
                                          listImagePath[2],
                                          scale: 9,
                                        );
                                      },
                                    ),
                                    Draggable(
                                      data: "assets/png/b13.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/b13.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/b13.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan 2",
                      icons: Icons.play_arrow_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: ExerciseThreePage(
                              exerciseTitle: "Latihan 2",
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/png/sepatu-dikotak.png",
                                      scale: 5,
                                    ),
                                    DragTarget(
                                      onAccept: (String imagePath) {
                                        listImagePath2[0] = imagePath;
                                      },
                                      onWillAccept: (image) {
                                        if (image == "assets/png/b12.png") {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/correct.mp3"),
                                          );
                                          return true;
                                        } else {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/wrong.mp3"),
                                          );
                                          buildAlert(false, () {
                                            Navigator.of(context).pop();
                                          });
                                          return false;
                                        }
                                      },
                                      builder: (context, candidateData,
                                          rejectedData) {
                                        return Image.asset(
                                          listImagePath2[0],
                                          scale: 9,
                                        );
                                      },
                                    ),
                                    Draggable(
                                      data: "assets/png/b14.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/b14.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/b14.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/png/rok-dikotak.png",
                                      scale: 5,
                                    ),
                                    DragTarget(
                                      onAccept: (String imagePath) {
                                        listImagePath2[1] = imagePath;
                                      },
                                      onWillAccept: (image) {
                                        if (image == "assets/png/b14.png") {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/correct.mp3"),
                                          );
                                          return true;
                                        } else {
                                          audioPlayer.play(
                                            AssetSource(
                                                "sounds/alert/wrong.mp3"),
                                          );
                                          buildAlert(false, () {
                                            Navigator.of(context).pop();
                                          });
                                          return false;
                                        }
                                      },
                                      builder: (context, candidateData,
                                          rejectedData) {
                                        return Image.asset(
                                          listImagePath2[1],
                                          scale: 9,
                                        );
                                      },
                                    ),
                                    Draggable(
                                      data: "assets/png/b12.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/b12.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/b12.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
