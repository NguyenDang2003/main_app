import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';
import 'package:flutter/gestures.dart';

class FuseBoxYearPage extends StatelessWidget {
  final String carName;
  final String carBrand;
  final Map<String, Object> yearToDiagram;

  const FuseBoxYearPage({
    required this.carBrand,
    required this.carName,
    required this.yearToDiagram,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('$carName - Fuse Box')),
      body: ScrollConfiguration(
        behavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView(
          children:
              yearToDiagram.entries.map((entry) {
                return Card(
                  child: ListTile(
                    title: Text('$carName ${entry.key}'),
                    trailing: Icon(Icons.electrical_services),

                    onTap: () {
                      final fuseBox =
                          ((carData[carBrand] as Map?)?[carName]
                                  as Map?)?['fuse_box']
                              as Map?;
                      final targetWidgetBuilder = fuseBox?[entry.key];

                      if (targetWidgetBuilder != null) {
                        if (targetWidgetBuilder is Function) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => targetWidgetBuilder(entry.key),
                            ),
                          );
                        } else {
                          return;
                        }
                      } else {
                        return;
                      }
                    },
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

// class FuseBoxDiagramPage extends StatelessWidget {
//   final String id;
//   final String carBrand;
//   final String carName;
//   final String year;
//   const FuseBoxDiagramPage({
//     required this.id,
//     required this.carBrand,
//     required this.carName,
//     required this.year,
//   });

//   @override
//   Widget build(BuildContext context) {
    
//     return 
//   }
// }
