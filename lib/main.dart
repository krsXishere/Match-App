import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tebak_gambar/pages/home_page.dart';
import 'package:tebak_gambar/providers/draw_line_provider.dart';
import 'package:tebak_gambar/providers/learning_video_provider.dart';
import 'package:tebak_gambar/providers/question_answer_provider.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  
  runApp(const MyApp());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]); 
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      providers: [
        ChangeNotifierProvider(
          create: (context) => LearningVideoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DrawLineProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuestionAnswerProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
