import 'package:flutter/material.dart';

class OwnerReviewsPage extends StatelessWidget {
  final String carBrand;
  final String carName;
  final List<dynamic> reviews;

  const OwnerReviewsPage({
    required this.carBrand,
    required this.carName,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('$carName - Reviews')),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(review['title']),
              subtitle: Text(review['content']),
            ),
          );
        },
      ),
    );
  }
}
