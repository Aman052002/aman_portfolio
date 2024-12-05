import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Resume'),
      ),
      body: SafeArea(
        child: PdfViewer.asset(
          'assets/images/aman_new_cv.pdf',
          params: const PdfViewerParams(),
        ),
      ),
    );
  }
}