import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

class CardocVolvoScreen extends StatelessWidget {
  const CardocVolvoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "VOLVO",
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
          itemCount: yearVolvo.length,
          itemBuilder: (context, index) {
            return _year(
              context: context,
              year: yearVolvo[index],
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
