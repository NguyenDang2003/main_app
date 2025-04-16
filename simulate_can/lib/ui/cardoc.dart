import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

class Cardoc extends StatelessWidget {
  const Cardoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CAR DOCUMENTS",
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
          itemCount: carBrands.length,
          itemBuilder: (context, index) {
            return _carBrandItem(
              context: context,
              nameimage: carBrands[index]['image']!,
              carbrand: carBrands[index]['name']!,
              index: index,
            );
          },
        ),
      ),
    );
  }

  Widget _carBrandItem({
    required BuildContext context,
    required String nameimage,
    required String carbrand,
    required int index,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: ListTile(
        leading: Image.asset(
          nameimage,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
        title: Text(
          carbrand,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => cardocScreens[index]),
          );
        },
      ),
    );
  }
}
