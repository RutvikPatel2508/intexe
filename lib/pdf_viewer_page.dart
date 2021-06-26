import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


class pdfview extends StatefulWidget {
 final String pdf;
 pdfview(this.pdf);
  @override
  _pdfviewState createState() => _pdfviewState(pdf);
}

class _pdfviewState extends State<pdfview> {
  final String pdf;
  _pdfviewState(this.pdf);
  bool _isLoading = true;
  PDFDocument document;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(pdf);

    setState(() => _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            children: [
              Container(
                height: 400,
                child: PDFViewer(document: document),
              ),
            ],
          ),
    );
  }
}