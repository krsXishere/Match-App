import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tebak_gambar/pages/quiz/quiz_five_page.dart';
import 'package:tebak_gambar/pages/quiz/quiz_four_page.dart';
import 'package:tebak_gambar/pages/quiz/quiz_one_page.dart';
import 'package:tebak_gambar/pages/quiz/quiz_three_page.dart';
import 'package:tebak_gambar/pages/quiz/quiz_two_page.dart';
import 'package:tebak_gambar/widgets/navigate_listtile_widget.dart';
import 'package:tebak_gambar/widgets/template_page_widget.dart';
import '../common/theme.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
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
                      title: "Latihan Pertemuan 1",
                      icons: Icons.arrow_forward_ios_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const QuizOnePage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan Pertemuan 2",
                      icons: Icons.arrow_forward_ios_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const QuizTwoPage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan Pertemuan 3",
                      icons: Icons.arrow_forward_ios_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const QuizThreePage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan Pertemuan 4",
                      icons: Icons.arrow_forward_ios_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const QuizFourPage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan Pertemuan 5",
                      icons: Icons.arrow_forward_ios_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const QuizFivePage(),
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
