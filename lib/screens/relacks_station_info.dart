import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class RelaksStationInfoScreen extends StatelessWidget {
  const RelaksStationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: const Text('About Our Station')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SfPdfViewer.asset(
            initialZoomLevel: 1.0,
            enableDoubleTapZooming: true,
            'images/pdf/Relaks Radio station.pdf'),
      ),
    );
  }
}
