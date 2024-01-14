import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tebak_gambar/providers/draw_line_provider.dart';
import '../../common/theme.dart';
// import '../../models/line_data_model.dart';
import '../../widgets/template_page_widget.dart';

class ExerciseTwoPage extends StatefulWidget {
  final String exerciseTitle;
  final List<String> imagePath;
  final List<double> imageScale;

  const ExerciseTwoPage({
    super.key,
    required this.exerciseTitle,
    required this.imagePath,
    required this.imageScale,
  });

  @override
  State<ExerciseTwoPage> createState() => _ExerciseTwoPageState();
}

class _ExerciseTwoPageState extends State<ExerciseTwoPage> {
  final audioPlayer = AudioPlayer();
  Offset? start;
  Offset? end;
  final List<Offset> points = [];
  final List<List<Offset>> lines = [];
  DrawLineProvider drawLineProvider = DrawLineProvider();
  GlobalKey keyWortel = GlobalKey();
  GlobalKey keyTomat = GlobalKey();
  GlobalKey keyBawang = GlobalKey();
  GlobalKey keyCabe = GlobalKey();
  GlobalKey keySeven = GlobalKey();
  GlobalKey keyFive = GlobalKey();
  GlobalKey keyEight = GlobalKey();
  GlobalKey keyNine = GlobalKey();
  // GlobalKey keyLine = GlobalKey();
  // List<GlobalKey> keyLines = List.generate(4, (_) => GlobalKey());
  List<List<GlobalKey>> connectedWidgetPairs = [];

  void connectWidgets(GlobalKey key1, GlobalKey key2) {
    connectedWidgetPairs.add([key1, key2]);
  }

  bool areWidgetsConnected(GlobalKey key1, GlobalKey key2) {
    bool isConnected = connectedWidgetPairs.any((pair) =>
        (pair[0] == key1 && pair[1] == key2) ||
        (pair[0] == key2 && pair[1] == key1));

    return isConnected;
  }

  @override
  void initState() {
    audioPlayer.play(
      AssetSource("sounds/alert/garis.wav"),
    );
    super.initState();
  }

  
  @override
  void didChangeDependencies() {
    drawLineProvider = Provider.of<DrawLineProvider>(
      context,
      listen: false,
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // ignore: unnecessary_null_comparison
    if (drawLineProvider != null) {
      drawLineProvider.disposeDrawLineProvider();
    }
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Consumer<DrawLineProvider>(
        builder: (context, value, child) {
          return TemplatepageWidget(
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
                    child: GestureDetector(
                      onPanStart: (details) {
                        value.getPoints(details.localPosition);
                        if (value.points.length == 2) {
                          // connectWidgets(keyTomat, keySeven);
                          value.getLines();
                        }
                      },
                      child: CustomPaint(
                        // key: keyLines[1],
                        painter: LinePainter(
                          lines: value.lines,
                          currentPoints: value.points,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  widget.imagePath[0],
                                  key: keyWortel,
                                  scale: widget.imageScale[0],
                                ),
                                Image.asset(
                                  widget.imagePath[1],
                                  key: keySeven,
                                  scale: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  widget.imagePath[2],
                                  key: keyTomat,
                                  scale: widget.imageScale[1],
                                ),
                                Image.asset(
                                  widget.imagePath[3],
                                  key: keyFive,
                                  scale: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  widget.imagePath[4],
                                  key: keyBawang,
                                  scale: widget.imageScale[2],
                                ),
                                Image.asset(
                                  widget.imagePath[5],
                                  key: keyEight,
                                  scale: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  widget.imagePath[6],
                                  key: keyCabe,
                                  scale: widget.imageScale[3],
                                ),
                                Image.asset(
                                  widget.imagePath[7],
                                  key: keyNine,
                                  scale: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  List<List<Offset>> lines = [];
  List<Offset> currentPoints = [];

  LinePainter({
    required this.lines,
    required this.currentPoints,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3;

    for (final line in lines) {
      canvas.drawLine(
        line[0],
        line[1],
        paint,
      );
    }

    if (currentPoints.length == 2) {
      canvas.drawLine(
        currentPoints[0],
        currentPoints[1],
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => true;
}

class LinesPainter extends CustomPainter {
  Offset? starts;
  Offset? ends;

  LinesPainter({
    required this.starts,
    required this.ends,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (starts == null || ends == null) return;
    canvas.drawLine(
      starts!,
      ends!,
      Paint()
        ..strokeWidth = 4
        ..color = Colors.redAccent,
    );
  }

  @override
  bool shouldRepaint(LinesPainter oldDelegate) {
    return true;
  }
}

// extension GlobalPaintBounds on BuildContext {
//   Rect? get globalPaintBounds {
//     final renderObject = findRenderObject();
//     final translation = renderObject?.getTransformTo(null).getTranslation();
//     if (translation != null && renderObject?.paintBounds != null) {
//       final offset = Offset(translation.x, translation.y);
//       return renderObject!.paintBounds.shift(offset);
//     } else {
//       return null;
//     }
//   }
// }

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}
