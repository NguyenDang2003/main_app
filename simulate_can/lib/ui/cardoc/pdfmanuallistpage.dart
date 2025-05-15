import 'package:flutter/material.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$carName - $section')),
      body: ListView.builder(
        itemCount: yearToPdf.length,
        itemBuilder: (context, index) {
          final year = yearToPdf.keys.elementAt(index);
          final path = yearToPdf[year]!;
          return ListTile(
            title: Text('Year $year'),
            trailing: Icon(Icons.picture_as_pdf),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => PDFViewerPage(
                        title: '$carName - $year',
                        pdfPath: path,
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

class PDFViewerPage extends StatelessWidget {
  final String title;
  final String pdfPath;

  const PDFViewerPage({required this.title, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Hiển thị PDF từ: $pdfPath',
        ), // Bạn có thể tích hợp `flutter_pdfview` hoặc `syncfusion_flutter_pdfviewer`
      ),
    );
  }
}
