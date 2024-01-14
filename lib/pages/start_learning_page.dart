import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tebak_gambar/pages/learning_video_page.dart';
import 'package:tebak_gambar/providers/learning_video_provider.dart';
import 'package:tebak_gambar/widgets/template_page_widget.dart';
import '../common/theme.dart';

class StartLearningPage extends StatefulWidget {
  const StartLearningPage({super.key});

  @override
  State<StartLearningPage> createState() => _StartLearningPageState();
}

class _StartLearningPageState extends State<StartLearningPage> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Consumer<LearningVideoProvider>(
        builder: (context, value, child) {
          final videos = value.videos;

          return TemplatepageWidget(
            widgets: [
              Positioned(
                top: 150,
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        final video = videos[index];

                        return ListTile(
                          leading: Text(
                            video.title.toString(),
                            style: primaryTextStyle,
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: LearningVideoPage(
                                    videoPath: video.videoPath.toString(),
                                  ),
                                  type: PageTransitionType.rightToLeft,
                                ),
                              );
                            },
                            child: Icon(
                              Icons.play_circle_fill_rounded,
                              color: white,
                              size: 30,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
