import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../common/theme.dart';
import '../../widgets/navigate_listtile_widget.dart';
import '../../widgets/template_page_widget.dart';
import '../exercise/exercise_two_page.dart';

class QuizFourPage extends StatefulWidget {
  const QuizFourPage({super.key});

  @override
  State<QuizFourPage> createState() => _QuizFourPageState();
}

class _QuizFourPageState extends State<QuizFourPage> {
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
                            child: const ExerciseTwoPage(
                              exerciseTitle: "Latihan 1",
                              imagePath: [
                                "assets/png/ambulan-dikotak.png",
                                "assets/png/d16.png",
                                "assets/png/sepeda-dikotak.png",
                                "assets/png/d20.png",
                                "assets/png/perahu-dikotak.png",
                                "assets/png/d17.png",
                                "assets/png/mobil-dikotak.png",
                                "assets/png/d15.png",
                              ],
                              imageScale: [
                                5,
                                5,
                                5,
                                5,
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