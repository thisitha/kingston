import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class viewPDF extends StatefulWidget {
  final pdfPath;
  const viewPDF({Key? key,@required this.pdfPath}) : super(key: key);

  @override
  State<viewPDF> createState() => _viewPDFState();
}

class _viewPDFState extends State<viewPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.asset(
          widget.pdfPath)
    );
  }
}
