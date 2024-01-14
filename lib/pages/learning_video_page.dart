import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tebak_gambar/common/theme.dart';
import 'package:tebak_gambar/providers/learning_video_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class LearningVideoPage extends StatefulWidget {
  final String videoPath;
  const LearningVideoPage({
    super.key,
    required this.videoPath,
  });

  @override
  State<LearningVideoPage> createState() => _LearningVideoPageState();
}

class _LearningVideoPageState extends State<LearningVideoPage> {
  late VideoPlayerController videoPlayerController;
  bool isLandscape = false;
  // late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.asset(widget.videoPath)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) async {
        videoPlayerController.play();
        await Wakelock.enable();
      });
    super.initState();
  }

  @override
  void dispose() async {
    videoPlayerController.dispose();
    await Wakelock.disable();
    setAllOrientation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<LearningVideoProvider>(
      builder: (context, value, child) {
        return Stack(
          fit: value.isLandscape == false ? StackFit.loose : StackFit.expand,
          children: [
            SizedBox(
              height: height,
              width: width,
              child: Image.asset(
                "assets/png/background.png",
                fit: BoxFit.fill,
              ),
            ),
            videoPlayerController.value.isInitialized
                ? buildVideo()
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple[100],
                    ),
                  ),
            Visibility(
              visible: value.isLandscape == true,
              child: Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    if (value.isLandscape == true) {
                      setAllOrientation();
                      value.setIsLandscape(false);
                    }
                  },
                  child: Icon(
                    Icons.fullscreen_exit_rounded,
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildVideo() => Consumer<LearningVideoProvider>(
        builder: (context, value, child) {
          return Stack(
            fit: value.isLandscape == false ? StackFit.loose : StackFit.expand,
            children: [
              buildVideoPlayer(),
              Positioned.fill(
                child: buildBasicOverlayWidget(),
              ),
            ],
          );
        },
      );

  Widget buildVideoPlayer() => buildFullscreen(
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: VideoPlayer(videoPlayerController),
        ),
      );

  Widget buildFullscreen({
    required Widget child,
  }) {
    final size = videoPlayerController.value.size;
    final width = size.width;
    final height = size.height;

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
    // return Consumer<LearningVideoProvider>(
    //   builder: (context, value, child) {
    //     return GestureDetector(
    //       onScaleUpdate: (details) {
    //         if (value.isPinched == false) {
    //           value.getIsPinched(true);
    //         } else {
    //           value.getIsPinched(false);
    //         }
    //       },
    //       child: FittedBox(
    //         fit: value.isPinched == false && value.isLandscape == true
    //             ? BoxFit.contain
    //             : BoxFit.cover,
    //         child: SizedBox(
    //           width: width,
    //           height: height,
    //           child: child,
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future setAllOrientation() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Widget buildBasicOverlayWidget() => Consumer<LearningVideoProvider>(
        builder: (context, value, child) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              videoPlayerController.value.isPlaying
                  ? videoPlayerController.pause()
                  : videoPlayerController.play();
            },
            child: Stack(
              children: [
                buildPlay(),
                Positioned(
                    bottom: 20,
                    left: 10,
                    child: DefaultTextStyle(
                      style: primaryTextStyle.copyWith(
                        color: white,
                        fontSize: 10,
                      ),
                      child: Text(
                        getPosition(),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: buildIndicator(),
                ),
                Visibility(
                  visible: value.isLandscape == false,
                  child: Positioned(
                    top: 180,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        if (value.isLandscape == false) {
                          setLandscape();
                          value.setIsLandscape(true);
                        }
                      },
                      child: Icon(
                        Icons.fullscreen_rounded,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );

  Widget buildIndicator() => VideoProgressIndicator(
        videoPlayerController,
        allowScrubbing: true,
        colors: VideoProgressColors(
          playedColor: Colors.purple[100]!,
          bufferedColor: unClickColor,
        ),
      );

  Widget buildPlay() => videoPlayerController.value.isPlaying
      ? const SizedBox.shrink()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow_rounded,
            color: white,
            size: 50,
          ),
        );

  String getPosition() {
    final duration = Duration(
        milliseconds:
            videoPlayerController.value.position.inMilliseconds.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((e) => e.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }
}
