import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tebak_gambar/widgets/template_page_widget.dart';

class ManualBookPage extends StatefulWidget {
  const ManualBookPage({super.key});

  @override
  State<ManualBookPage> createState() => _ManualBookPageState();
}

class _ManualBookPageState extends State<ManualBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplatepageWidget(
        widgets: [
          SfPdfViewer.asset(
            "assets/pdf/manual-book.pdf",
          ),
        ],
      ),
    );
  }
}
