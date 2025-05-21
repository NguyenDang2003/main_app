import 'package:flutter/material.dart';
import 'pdfmanuallistpage.dart';

class UsefulGuidesPage extends StatelessWidget {
  final String carBrand;
  final String carName;
  final Map<String, dynamic> guideSections;

  const UsefulGuidesPage({
    required this.carBrand,
    required this.carName,
    required this.guideSections,
  });

  @override
  Widget build(BuildContext context) {
    final sectionNames = guideSections.keys.toList();

    return Scaffold(
      appBar: AppBar(title: Text('$carName - Useful Guides')),
      body: ListView.builder(
        itemCount: sectionNames.length,
        itemBuilder: (context, index) {
          final section = sectionNames[index];
          final guideItems = guideSections[section] as Map<String, String>;

          return Card(
            child: ListTile(
              title: Text(section),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) =>
                            GuideDetailPage(title: section, guides: guideItems),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class GuideDetailPage extends StatelessWidget {
  final String title;
  final Map<String, String> guides;

  const GuideDetailPage({required this.title, required this.guides});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children:
            guides.entries.map((e) {
              return ListTile(
                title: Text(e.key),
                trailing: Icon(Icons.article),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => PDFViewerPage(title: e.key, pdfUrl: e.value),
                    ),
                  );
                },
              );
            }).toList(),
      ),
    );
  }
}
