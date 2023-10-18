import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: const Text('About Relaks Media')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SfPdfViewer.asset(
            initialZoomLevel: 1.0,
            enableDoubleTapZooming: true,
            'images/pdf/about.pdf'),
      ),
    );
  }
}
