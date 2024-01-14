import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tebak_gambar/widgets/alert_check_answer_widget.dart';
import 'package:tebak_gambar/widgets/template_page_widget.dart';
import '../../common/theme.dart';

class ExerciseOnePage extends StatefulWidget {
  final String audioPath, exerciseTitle, stuff;
  final List<Widget> question;
  final List<String> answer;
  final double heightGridViewQuestion;
  final List<bool> trueAnswer;

  const ExerciseOnePage({
    super.key,
    required this.audioPath,
    required this.exerciseTitle,
    required this.stuff,
    required this.question,
    required this.answer,
    required this.heightGridViewQuestion,
    required this.trueAnswer,
  });

  @override
  State<ExerciseOnePage> createState() => _ExerciseOnePageState();
}

class _ExerciseOnePageState extends State<ExerciseOnePage> {
  final audioPlayer = AudioPlayer();

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
  void initState() {
    audioPlayer.play(
      AssetSource("sounds/${widget.audioPath}-0.mp3"),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: widget.heightGridViewQuestion,
                          width: width * 0.6,
                          child: GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            children: widget.question,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Berapa jumlah ${widget.stuff} di atas?",
                        textAlign: TextAlign.center,
                        style: primaryTextStyle.copyWith(
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.6,
                        height: 300,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (widget.trueAnswer[0] == true) {
                                  audioPlayer.play(
                                    AssetSource(
                                        "sounds/${widget.audioPath}-1.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[0],
                                    () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  );
                                } else {
                                  audioPlayer.play(
                                    AssetSource("sounds/alert/wrong.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[0],
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              },
                              child: Image.asset(
                                widget.answer[0],
                                scale: 5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.trueAnswer[1] == true) {
                                  audioPlayer.play(
                                    AssetSource(
                                        "sounds/${widget.audioPath}-1.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[1],
                                    () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  );
                                } else {
                                  audioPlayer.play(
                                    AssetSource("sounds/alert/wrong.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[1],
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              },
                              child: Image.asset(
                                widget.answer[1],
                                scale: 5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.trueAnswer[2] == true) {
                                  audioPlayer.play(
                                    AssetSource(
                                        "sounds/${widget.audioPath}-1.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[2],
                                    () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  );
                                } else {
                                  audioPlayer.play(
                                    AssetSource("sounds/alert/wrong.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[2],
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              },
                              child: Image.asset(
                                widget.answer[2],
                                scale: 5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.trueAnswer[3] == true) {
                                  audioPlayer.play(
                                    AssetSource(
                                        "sounds/${widget.audioPath}-1.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[3],
                                    () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  );
                                } else {
                                  audioPlayer.play(
                                    AssetSource("sounds/alert/wrong.mp3"),
                                  );
                                  buildAlert(
                                    widget.trueAnswer[3],
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              },
                              child: Image.asset(
                                widget.answer[3],
                                scale: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
