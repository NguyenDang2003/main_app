import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      home: const Cardoc(),
    ),
  );
}

class Cardoc extends StatelessWidget {
  const Cardoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          "CAR DOCUMENTS",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
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
      color: Colors.grey[100],
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
        trailing: const Icon(Icons.arrow_forward_ios),
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
