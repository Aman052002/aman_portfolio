import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class MyCV extends StatefulWidget {
  const MyCV({Key? key}) : super(key: key);

  @override
  State<MyCV> createState() => _MyCVState();
}

class _MyCVState extends State<MyCV> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PdfViewer.openAsset(
        'assets/images/aman_new_cv.pdf',
      ),
    );
  }
}
