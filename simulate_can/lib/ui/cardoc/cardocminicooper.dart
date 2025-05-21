import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

class CardocMiniCooperScreen extends StatelessWidget {
  const CardocMiniCooperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "MINI COOPER",
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
        child: ListView.builder(
          itemCount: yearMinicooper.length,
          itemBuilder: (context, index) {
            return _year(
              context: context,
              year: yearMinicooper[index],
              index: index,
            );
          },
        ),
      ),
    );
  }

  Widget _year({
    required BuildContext context,

    required String year,
    required int index,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: ListTile(
        title: Text(
          year,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
