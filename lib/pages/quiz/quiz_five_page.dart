import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tebak_gambar/pages/exercise/exercise_five_page.dart';
import '../../common/theme.dart';
import '../../widgets/alert_check_answer_widget.dart';
import '../../widgets/navigate_listtile_widget.dart';
import '../../widgets/template_page_widget.dart';

class QuizFivePage extends StatefulWidget {
  const QuizFivePage({super.key});

  @override
  State<QuizFivePage> createState() => _QuizFivePageState();
}

class _QuizFivePageState extends State<QuizFivePage> {
  final audioPlayer = AudioPlayer();
  List<String> listImagePath = [
    "assets/png/garis-putus-persegi.png",
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
                            child: ExerciseFivePage(
                              exerciseTitle: "Latihan 1",
                              children: [
                                Image.asset(
                                  "assets/png/kipas-dikotak.png",
                                  scale: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: DragTarget(
                                    onAccept: (String imagePath) {
                                      listImagePath[0] = imagePath;
                                    },
                                    onWillAccept: (image) {
                                      if (image == "assets/png/f6.png") {
                                        audioPlayer.play(
                                          AssetSource(
                                              "sounds/alert/correct.mp3"),
                                        );
                                        return true;
                                      } else {
                                        audioPlayer.play(
                                          AssetSource("sounds/alert/wrong.mp3"),
                                        );
                                        buildAlert(false, () {
                                          Navigator.of(context).pop();
                                        });
                                        return false;
                                      }
                                    },
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return Image.asset(
                                        listImagePath[0],
                                        scale: 7,
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Draggable(
                                      data: "assets/png/f7.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/f7.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/f7.png",
                                        scale: 5,
                                      ),
                                    ),
                                    Draggable(
                                      data: "assets/png/f6.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/f6.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/f6.png",
                                        scale: 5,
                                      ),
                                    ),
                                    Draggable(
                                      data: "assets/png/f8.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/f8.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/f8.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                )
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
                            child: ExerciseFivePage(
                              exerciseTitle: "Latihan 2",
                              children: [
                                Image.asset(
                                  "assets/png/setrika-dikotak.png",
                                  scale: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: DragTarget(
                                    onAccept: (String imagePath) {
                                      listImagePath[1] = imagePath;
                                    },
                                    onWillAccept: (image) {
                                      if (image == "assets/png/g12.png") {
                                        audioPlayer.play(
                                          AssetSource(
                                              "sounds/alert/correct.mp3"),
                                        );
                                        return true;
                                      } else {
                                        audioPlayer.play(
                                          AssetSource("sounds/alert/wrong.mp3"),
                                        );
                                        buildAlert(false, () {
                                          Navigator.of(context).pop();
                                        });
                                        return false;
                                      }
                                    },
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return Image.asset(
                                        listImagePath[1],
                                        scale: 7,
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Draggable(
                                      data: "assets/png/g12.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/g12.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/g12.png",
                                        scale: 5,
                                      ),
                                    ),
                                    Draggable(
                                      data: "assets/png/g15.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/g15.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/g15.png",
                                        scale: 5,
                                      ),
                                    ),
                                    Draggable(
                                      data: "assets/png/g13.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/g13.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/g13.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan 3",
                      icons: Icons.play_arrow_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: ExerciseFivePage(
                              exerciseTitle: "Latihan 3",
                              children: [
                                Image.asset(
                                  "assets/png/spons-dikotak.png",
                                  scale: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: DragTarget(
                                    onAccept: (String imagePath) {
                                      listImagePath[2] = imagePath;
                                    },
                                    onWillAccept: (image) {
                                      if (image == "assets/png/h19.png") {
                                        audioPlayer.play(
                                          AssetSource(
                                              "sounds/alert/correct.mp3"),
                                        );
                                        return true;
                                      } else {
                                        audioPlayer.play(
                                          AssetSource("sounds/alert/wrong.mp3"),
                                        );
                                        buildAlert(false, () {
                                          Navigator.of(context).pop();
                                        });
                                        return false;
                                      }
                                    },
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return Image.asset(
                                        listImagePath[2],
                                        scale: 7,
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Draggable(
                                      data: "assets/png/h17.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/h17.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/h17.png",
                                        scale: 5,
                                      ),
                                    ),
                                    Draggable(
                                      data: "assets/png/h20.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/h20.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/h20.png",
                                        scale: 5,
                                      ),
                                    ),
                                    Draggable(
                                      data: "assets/png/h19.png",
                                      onDraggableCanceled:
                                          (velocity, offset) {},
                                      feedback: Image.asset(
                                        "assets/png/h19.png",
                                        scale: 4,
                                      ),
                                      child: Image.asset(
                                        "assets/png/h19.png",
                                        scale: 5,
                                      ),
                                    ),
                                  ],
                                )
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
