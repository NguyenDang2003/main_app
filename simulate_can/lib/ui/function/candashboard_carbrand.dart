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
      home: const CandashboardCarbrand(),
    ),
  );
}

class CandashboardCarbrand extends StatelessWidget {
  const CandashboardCarbrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DASHBOARD SIMULATE - CAR BRANDS",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: carBrands.length,
          itemBuilder: (context, index) {
            return _carbuildbrand(
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

  Widget _carbuildbrand({
    required BuildContext context,
    required String nameimage,
    required String carbrand,
    required int index,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => dashboardcarScreens[index]),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Image.asset(nameimage, height: 120, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          Text(
            carbrand,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
