import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFManualListPage extends StatelessWidget {
  final String carBrand;
  final String carName;
  final String section;
  final Map<String, String> yearToPdf;

  const PDFManualListPage({
    required this.carBrand,
    required this.carName,
    required this.section,
    required this.yearToPdf,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('$carName - $section')),
      body: ListView.builder(
        itemCount: yearToPdf.length,
        itemBuilder: (context, index) {
          final year = yearToPdf.keys.elementAt(index);
          final path = yearToPdf[year]!;
          return ListTile(
            title: Text('Year $year'),
            trailing: const Icon(Icons.picture_as_pdf),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => PDFViewerPage(
                        title: '$carName - $year',
                        pdfUrl: path,
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ----------------------------
class PDFViewerPage extends StatefulWidget {
  final String title;
  final String pdfUrl;

  const PDFViewerPage({required this.title, required this.pdfUrl, Key? key})
    : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SfPdfViewer.network(widget.pdfUrl),
    );
  }
}
