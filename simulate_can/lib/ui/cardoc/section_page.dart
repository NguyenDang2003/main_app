import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

class CarSectionPage extends StatelessWidget {
  final String carName;
  final String carBrand;
  final Map<String, dynamic> carData;

  CarSectionPage({
    required this.carBrand,
    required this.carName,
    required this.carData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(carName), centerTitle: true),
      body: ListView.builder(
        itemCount: carDocSections.length,
        itemBuilder: (context, index) {
          final section = carDocSections[index];
          print(section);
          final sectionData =
              ((carData[carBrand] as Map?)?[carName] as Map?)?[section['id']];
          print(sectionData);
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text(
                section['title'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                final widgetBuilder = section['widget'];
                final sectionData =
                    ((carData[carBrand] as Map?)?[carName]
                        as Map?)?[section['id']];

                if (widgetBuilder is Function &&
                    sectionData is Map<String, dynamic>) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => widgetBuilder(carBrand, carName, sectionData),
                    ),
                  );
                } else {
                  return;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
