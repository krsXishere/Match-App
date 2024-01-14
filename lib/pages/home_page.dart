import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tebak_gambar/pages/exercise_page.dart';
import 'package:tebak_gambar/pages/manual_book_page.dart';
import 'package:tebak_gambar/pages/start_learning_page.dart';
import 'package:tebak_gambar/widgets/custom_button_widget.dart';

import '../common/theme.dart';
import '../providers/learning_video_provider.dart';
import '../widgets/template_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LearningVideoProvider>(
        context,
        listen: false,
      ).getVideo();
    });

    return Scaffold(
      body: TemplatepageWidget(
        widgets: [
          Positioned(
            top: 150,
            child: Image.asset(
              "assets/png/logo-aplikasi.png",
              scale: 4,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 200,
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
                    CustomButtonWidget(
                      text: "Mulai Belajar",
                      onPressed: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const StartLearningPage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    CustomButtonWidget(
                      text: "Latihan",
                      onPressed: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const ExercisePage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    CustomButtonWidget(
                      text: "Panduan Pengguna",
                      onPressed: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const ManualBookPage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    ),
                    CustomButtonWidget(
                      text: "Keluar",
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: white.withOpacity(0.8),
                              actionsAlignment: MainAxisAlignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              title: Text(
                                "Yakin mau keluar?",
                                textAlign: TextAlign.center,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              content: SizedBox(
                                height: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/png/bintang-salah.png",
                                      scale: 5,
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: CustomButtonWidget(
                                    text: "Keluar",
                                    onPressed: () {
                                      SystemNavigator.pop();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: CustomButtonWidget(
                                    text: "Batal",
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
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
