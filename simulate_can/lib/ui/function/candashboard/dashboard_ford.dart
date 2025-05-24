import 'dart:isolate';

import 'package:flutter/material.dart';
// import 'dart:ui'; // Để sử dụng BackdropFilter
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:simulate_can/var.dart';

class DashboardFord extends StatefulWidget {
  const DashboardFord({super.key});
  @override
  DashboardFordState createState() => DashboardFordState();
}

class DashboardFordState extends State<DashboardFord> {
  void sendData(String addr, String field, String value) async {
    final url = Uri.parse('http://127.0.0.1:8000/send'); // thay <raspi-ip>

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'addr': addr, 'field': field, 'value': value}),
      );

      if (response.statusCode == 200) {
        print('✅ Gửi thành công tới $addr: $field = $value');
      } else {
        print('❌ Lỗi khi gửi: ${response.body}');
      }
    } catch (e) {
      print('❌ Lỗi kết nối: $e');
    }
  }

  final double imageOriginalWidth = 1920;
  final double imageOriginalHeight = 1080;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DASHBOARD SIMULATE - FORD',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final parentWidth = constraints.maxWidth;
          final parentHeight = constraints.maxHeight;

          final scale =
              (parentWidth / imageOriginalWidth <
                      parentHeight / imageOriginalHeight)
                  ? parentWidth / imageOriginalWidth
                  : parentHeight / imageOriginalHeight;

          final imageDisplayWidth = imageOriginalWidth * scale;
          final imageDisplayHeight = imageOriginalHeight * scale;

          final offsetX = (parentWidth - imageDisplayWidth) / 2;
          final offsetY = (parentHeight - imageDisplayHeight) / 2;
          return Stack(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/Dashboard/FORD.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              // Connection
              Align(
                alignment: Alignment(1, -1), // Góc trên bên phải
                child: Container(
                  width: 130, // Cố định gọn chiều rộng
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'CONNECTION',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color:
                              fordisConnectedDashboard
                                  ? Colors.green
                                  : Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FittedBox(
                          child: Text(
                            fordisConnectedDashboard
                                ? 'Connected'
                                : 'Disconnected',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  fordisConnectedDashboard = true;
                                  sendData('1', 'FORD_ON', '64');
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: Text('On', style: TextStyle(fontSize: 12)),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  fordisConnectedDashboard = false;
                                  sendData('1', 'FORD_OFF', '00');
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: Text(
                                'Off',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ABS
              buildToggleImageButton(
                x: 700,
                y: 600,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 50,
                sizey: 50,
                scale: scale,
                addr: '1',
                field: 'FORD_ABS',
                valueOn: '80',
                valueOff: '00',
                isActive: fordisActive,
                onToggle: (newState) {
                  setState(() {
                    fordisActive = newState;
                  });
                },
                activeColor: Colors.orange,
                assetPath: 'assets/images/abs.png',
              ),
              // Phanh tay
              buildToggleImageButton(
                x: 1150,
                y: 600,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 50,
                sizey: 50,
                scale: scale,
                addr: '1',
                field: 'FORD_BRAKE',
                valueOn: '20',
                valueOff: '00',
                isActive: fordisActive1,
                onToggle: (newState) {
                  setState(() {
                    fordisActive1 = newState;
                  });
                },
                activeColor: Colors.red,
                assetPath: 'assets/images/brake.png',
              ),
              // airbag
              buildToggleImageButton(
                x: 1250,
                y: 600,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 70,
                sizey: 70,
                scale: scale,
                addr: '1',
                field: 'FORD_SRS',
                valueOn: '',
                valueOff: '',
                isActive: fordisActive2,
                onToggle: (newState) {
                  setState(() {
                    fordisActive2 = newState;
                  });
                },
                activeColor: Colors.orange,
                assetPath: 'assets/images/airbag.png',
              ),
              // ESP on
              buildToggleImageButton(
                x: 1250,
                y: 330,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 50,
                sizey: 50,
                scale: scale,
                addr: '1',
                field: 'FORD_TCS',
                valueOn: '227',
                valueOff: '00',
                isActive: fordisActive3,
                onToggle: (newState) {
                  setState(() {
                    fordisActive3 = newState;
                  });
                },
                activeColor: Colors.orange,
                assetPath: 'assets/images/esp.png',
              ),
              // ESP  off
              buildToggleImageButton(
                x: 1200,
                y: 340,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 40,
                sizey: 35,
                scale: scale,
                addr: '1',
                field: 'FORD_TCS_OFF',
                valueOn: '08',
                valueOff: '00',
                isActive: fordisActive4,
                onToggle: (newState) {
                  setState(() {
                    fordisActive4 = newState;
                  });
                },
                activeColor: Colors.orange,
                assetPath: 'assets/images/esp_off.png',
              ),
              // adblue  off
              buildToggleImageButton(
                x: 700,
                y: 300,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 90,
                sizey: 120,
                scale: scale,
                addr: '2',
                field: 'srs',
                valueOn: '20',
                valueOff: '0',
                isActive: fordisActive5,
                onToggle: (newState) {
                  setState(() {
                    fordisActive5 = newState;
                  });
                },
                activeColor: Colors.orange,
                assetPath: 'assets/images/adblue.png',
              ),
              // Tyre pressure
              buildToggleImageButton(
                x: 650,
                y: 330,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 50,
                sizey: 50,
                scale: scale,
                addr: '1',
                field: 'FORD_TPMS',
                valueOn: '256',
                valueOff: '00',
                isActive: fordisActive6,
                onToggle: (newState) {
                  setState(() {
                    fordisActive6 = newState;
                  });
                },
                activeColor: Colors.orange,
                assetPath: 'assets/images/tyrepressure.png',
              ),
              // engine
              buildToggleImageButton(
                x: 580,
                y: 330,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 50,
                sizey: 50,
                scale: scale,
                addr: '1',
                field: 'FORD_MIL',
                valueOn: '12',
                valueOff: '00',
                isActive: fordisActive7,
                onToggle: (newState) {
                  setState(() {
                    fordisActive7 = newState;
                  });
                },
                activeColor: Colors.orange,
                assetPath: 'assets/images/engine.png',
              ),
              // ac
              buildToggleImageButton(
                x: 1300,
                y: 470,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 50,
                sizey: 50,
                scale: scale,
                addr: '1',
                field: 'FORD_AC',
                valueOn: '',
                valueOff: '',
                isActive: fordisActive8,
                onToggle: (newState) {
                  setState(() {
                    fordisActive8 = newState;
                  });
                },
                activeColor: Colors.blue,
                assetPath: 'assets/images/ac.png',
              ),
              // turn left
              buildToggleImageButton(
                x: 900,
                y: 400,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 40,
                sizey: 40,
                scale: scale,
                addr: '2',
                field: 'field',
                valueOn: '20',
                valueOff: '0',
                isActive: fordisActive9,
                onToggle: (newState) {
                  setState(() {
                    fordisActive9 = newState;
                  });
                },
                activeColor: Colors.green,
                assetPath: 'assets/images/left.png',
              ),
              // turn right
              buildToggleImageButton(
                x: 970,
                y: 400,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 40,
                sizey: 40,
                scale: scale,
                addr: '2',
                field: 'field',
                valueOn: '20',
                valueOff: '0',
                isActive: fordisActive10,
                onToggle: (newState) {
                  setState(() {
                    fordisActive10 = newState;
                  });
                },
                activeColor: Colors.green,
                assetPath: 'assets/images/right.png',
              ),
              // headlight
              buildToggleImageButton(
                x: 450,
                y: 600,
                offsetX: offsetX,
                offsetY: offsetY,
                sizex: 45,
                sizey: 45,
                scale: scale,
                addr: '2',
                field: 'field',
                valueOn: '20',
                valueOff: '0',
                isActive: fordisActive11,
                onToggle: (newState) {
                  setState(() {
                    fordisActive11 = newState;
                  });
                },
                activeColor: Colors.green,
                assetPath: 'assets/images/headlight.png',
              ),

              Positioned(
                left: offsetX + 900 * scale,
                top: offsetY + 500 * scale,
                width: 140 * scale,
                height: 70 * scale,
                child: GestureDetector(
                  child: SizedBox(
                    height: 70 * scale,
                    width: 140 * scale,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Row(
                        children: [
                          Expanded(
                            // Sử dụng Expanded để TextField lấp đầy không gian còn lại
                            child: TextField(
                              controller: fordvehicleSpeedController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ), // Canh nội dung TextField
                                label: Text(
                                  "  km/h",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 7,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ), // Viền khi không focus
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ), // Viền khi focus
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildToggleImageButton({
    required double x,
    required double y,
    required double offsetX,
    required double offsetY,
    required double sizex,
    required double sizey,
    required double scale,
    required String addr,
    required String field,
    required String valueOn,
    required String valueOff,
    required bool isActive,
    required void Function(bool newState) onToggle,
    required Color activeColor,
    required String assetPath,
  }) {
    return Positioned(
      left: offsetX + x * scale,
      top: offsetY + y * scale,
      width: sizex * scale,
      height: sizey * scale,
      child: GestureDetector(
        onTap: () {
          bool newState = !isActive;
          onToggle(newState);
          sendData(addr, field, newState ? valueOn : valueOff);
        },
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            isActive ? activeColor : Colors.grey,
            BlendMode.srcATop,
          ),
          child: Image.asset(
            assetPath,
            height: sizey * scale,
            width: sizex * scale,
          ),
        ),
      ),
    );
  }
}
