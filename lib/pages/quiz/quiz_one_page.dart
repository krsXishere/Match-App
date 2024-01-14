import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tebak_gambar/pages/exercise/exercise_one_page.dart';
import 'package:tebak_gambar/widgets/navigate_listtile_widget.dart';
import 'package:tebak_gambar/widgets/template_page_widget.dart';
import '../../common/theme.dart';

class QuizOnePage extends StatefulWidget {
  const QuizOnePage({super.key});

  @override
  State<QuizOnePage> createState() => _QuizOnePageState();
}

class _QuizOnePageState extends State<QuizOnePage> {
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
                            child: ExerciseOnePage(
                              audioPath:
                                  "mari-menghitung-buku/mari-menghitung-buku",
                              exerciseTitle: "Latihan 1",
                              stuff: "buku",
                              question: [
                                Image.asset(
                                  "assets/png/buku.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/buku.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/buku.png",
                                  scale: 5,
                                ),
                              ],
                              answer: const [
                                "assets/png/A1.1.png",
                                "assets/png/A1.2.png",
                                "assets/png/A1.3.png",
                                "assets/png/A1.4.png",
                              ],
                              heightGridViewQuestion: 150,
                              trueAnswer: const [
                                false,
                                false,
                                true,
                                false,
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
                            child: ExerciseOnePage(
                              audioPath:
                                  "mari-menghitung-penghapus/mari-menghitung-penghapus",
                              exerciseTitle: "Latihan 2",
                              stuff: "penghapus",
                              question: [
                                Image.asset(
                                  "assets/png/penghapus.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/penghapus.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/penghapus.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/penghapus.png",
                                  scale: 5,
                                ),
                              ],
                              answer: const [
                                "assets/png/A1.1.png",
                                "assets/png/A1.2.png",
                                "assets/png/A1.3.png",
                                "assets/png/A1.4.png",
                              ],
                              heightGridViewQuestion: 200,
                              trueAnswer: const [
                                false,
                                false,
                                false,
                                true,
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
                            child: ExerciseOnePage(
                              audioPath:
                                  "mari-menghitung-tas/mari-menghitung-tas",
                              exerciseTitle: "Latihan 3",
                              stuff: "tas",
                              question: [
                                Image.asset(
                                  "assets/png/tas.png",
                                  scale: 5,
                                ),
                              ],
                              answer: const [
                                "assets/png/A1.1.png",
                                "assets/png/A1.2.png",
                                "assets/png/A1.3.png",
                                "assets/png/A1.4.png",
                              ],
                              heightGridViewQuestion: 150,
                              trueAnswer: const [
                                true,
                                false,
                                false,
                                false,
                              ],
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan 4",
                      icons: Icons.play_arrow_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: ExerciseOnePage(
                              audioPath:
                                  "mari-menghitung-pensil/mari-menghitung-pensil",
                              exerciseTitle: "Latihan 4",
                              stuff: "pensil",
                              question: [
                                Image.asset(
                                  "assets/png/pensil.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/pensil.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/pensil.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/pensil.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/pensil.png",
                                  scale: 5,
                                ),
                              ],
                              answer: const [
                                "assets/png/A1.1.png",
                                "assets/png/A1.2.png",
                                "assets/png/A1.3.png",
                                "assets/png/A1.5.png",
                              ],
                              heightGridViewQuestion: 200,
                              trueAnswer: const [
                                false,
                                false,
                                false,
                                true,
                              ],
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    NavigateListTile(
                      title: "Latihan 5",
                      icons: Icons.play_arrow_rounded,
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: ExerciseOnePage(
                              audioPath:
                                  "mari-menghitung-penggaris/mari-menghitung-penggaris",
                              exerciseTitle: "Latihan 5",
                              stuff: "penggaris",
                              question: [
                                Image.asset(
                                  "assets/png/penggaris.png",
                                  scale: 5,
                                ),
                                Image.asset(
                                  "assets/png/penggaris.png",
                                  scale: 5,
                                ),
                              ],
                              answer: const [
                                "assets/png/A1.1.png",
                                "assets/png/A1.2.png",
                                "assets/png/A1.3.png",
                                "assets/png/A1.4.png",
                              ],
                              heightGridViewQuestion: 150,
                              trueAnswer: const [
                                false,
                                true,
                                false,
                                false,
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
