import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyCV extends StatefulWidget {
  const MyCV({Key? key}) : super(key: key);

  @override
  State<MyCV> createState() => _MyCVState();
}

class _MyCVState extends State<MyCV> {
  late Future<Uint8List> _loadPdf;

  @override
  void initState() {
    super.initState();
    _loadPdf = loadPdfFromAssets();
  }

  Future<Uint8List> loadPdfFromAssets() async {
    final data = await rootBundle.load('assets/images/aman_rathore_cv.pdf');
    return data.buffer.asUint8List();
  }

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
      body: FutureBuilder<Uint8List>(
        future: _loadPdf,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData &&  snapshot.data != null) {
              print('snapshot.data:::  ${snapshot.data}');
              return SfPdfViewer.memory(snapshot.data!);
            } else {
              return const Center(child: Text('Failed to load PDF'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
