import 'package:flutter/material.dart';

class ComparisonPage extends StatelessWidget {
  final String carBrand;
  final String carName;
  final List<dynamic> comparisons;

  const ComparisonPage({
    required this.carBrand,
    required this.carName,
    required this.comparisons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$carName - Comparisons')),
      body: ListView.builder(
        itemCount: comparisons.length,
        itemBuilder: (context, index) {
          final item = comparisons[index];
          return ListTile(
            title: Text('Compare with ${item['with']}'),
            trailing: Icon(Icons.compare_arrows),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ComparisonDetailPage(id: item['id']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ComparisonDetailPage extends StatelessWidget {
  final String id;

  const ComparisonDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comparison')),
      body: Center(child: Text('Hiển thị so sánh cho ID: $id')),
    );
  }
}
