import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';
import '../section_page.dart';

class CardocMitsubishiScreen extends StatelessWidget {
  const CardocMitsubishiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MITSUBISHI",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScrollConfiguration(
          behavior: MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          child: ListView.builder(
            itemCount: carMitsubishi.length,
            itemBuilder: (context, index) {
              return _carModel(
                context: context,

                carName: carMitsubishi[index],
                carBrand: 'MITSUBISHI',
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _carModel({
    required BuildContext context,
    required String carBrand,
    required String carName,
    required int index,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: ListTile(
        title: Text(
          carName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.directions_car),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => CarSectionPage(
                    carBrand: carBrand,
                    carName: carName,
                    carData: carData,
                  ),
            ),
          );
        },
      ),
    );
  }
}
