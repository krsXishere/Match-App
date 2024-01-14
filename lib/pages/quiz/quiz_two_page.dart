import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tebak_gambar/pages/exercise/exercise_two_page.dart';
import '../../common/theme.dart';
import '../../widgets/navigate_listtile_widget.dart';
import '../../widgets/template_page_widget.dart';

class QuizTwoPage extends StatefulWidget {
  const QuizTwoPage({super.key});

  @override
  State<QuizTwoPage> createState() => _QuizTwoPageState();
}

class _QuizTwoPageState extends State<QuizTwoPage> {
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
                                "assets/png/wortel-kotak.png",
                                "assets/png/7-pink.png",
                                "assets/png/tomat-kotak.png",
                                "assets/png/5-pink.png",
                                "assets/png/bawang-kotak.png",
                                "assets/png/8-pink.png",
                                "assets/png/cabe-kotak.png",
                                "assets/png/9-pink.png",
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
                    NavigateListTile(
                      title: "Latihan 2",
                      icons: Icons.play_arrow_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const ExerciseTwoPage(
                              exerciseTitle: "Latihan 2",
                              imagePath: [
                                "assets/png/6-brokoli-dikotak.png",
                                "assets/png/10-pink.png",
                                "assets/png/10-jagung-dikotak.png",
                                "assets/png/9-pink.png",
                                "assets/png/bawang-kotak.png",
                                "assets/png/7-pink.png",
                                "assets/png/9-terong-dikotak.png",
                                "assets/png/6-pink.png",
                              ],
                              imageScale: [
                                9.5,
                                9.5,
                                5,
                                9,
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
                            child: const ExerciseTwoPage(
                              exerciseTitle: "Latihan 3",
                              imagePath: [
                                "assets/png/7-brokoli-dikotak.png",
                                "assets/png/8-pink.png",
                                "assets/png/10-jagung-dikotak.png",
                                "assets/png/10-pink.png",
                                "assets/png/6-bawang-dikotak.png",
                                "assets/png/7-pink.png",
                                "assets/png/9-terong-dikotak.png",
                                "assets/png/6-pink.png",
                              ],
                              imageScale: [
                                9.5,
                                9.5,
                                10,
                                9,
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
