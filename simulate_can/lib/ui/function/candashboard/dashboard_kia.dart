import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui'; // Để sử dụng BackdropFilter
import 'package:simulate_can/var.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

class DashboardKia extends StatefulWidget {
  const DashboardKia({super.key});
  @override
  DashboardKiaState createState() => DashboardKiaState();
}

class DashboardKiaState extends State<DashboardKia> {
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
          'DASHBOARD SIMULATE - KIA',
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
          // final parentWidth = constraints.maxWidth;
          // final parentHeight = constraints.maxHeight;

          // final scale =
          //     (parentWidth / imageOriginalWidth <
          //             parentHeight / imageOriginalHeight)
          //         ? parentWidth / imageOriginalWidth
          //         : parentHeight / imageOriginalHeight;

          // final imageDisplayWidth = imageOriginalWidth * scale;
          // final imageDisplayHeight = imageOriginalHeight * scale;

          // final offsetX = (parentWidth - imageDisplayWidth) / 2;
          // final offsetY = (parentHeight - imageDisplayHeight) / 2;
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/Dashboard/KIA.png", // Thay bằng ảnh bảng đồng hồ của bạn
                  fit: BoxFit.cover,
                ),
              ),

              // --------------------------------------------------
              Align(
                alignment: Alignment(
                  0.2,
                  -0.22,
                ), // Điều chỉnh vị trí theo tỷ lệ
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      kiaisActive = !kiaisActive;
                      if (kiaisActive == true) {
                        sendData('1', 'KIA_TCS_OFF', '11');
                      } else {
                        sendData('1', 'KIA_TCS_OFF', '09');
                      }
                    });
                  },
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      kiaisActive ? Colors.yellow : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/images/esp_off.png",
                      width: MediaQuery.of(context).size.width * 0.031,
                      height: MediaQuery.of(context).size.width * 0.031,
                    ),
                  ),
                ),
              ),
              // ---------------------------------------------------
              Align(
                alignment: Alignment(-0.2, 0.8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      kiaisActive1 = !kiaisActive1;
                      if (kiaisActive1 == true) {
                        sendData('1', 'KIA_EBD', '04');
                      } else {
                        sendData('1', 'KIA_EBD', '00');
                      }
                    });
                  },
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      kiaisActive1 ? Colors.red : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/images/brake1.png",
                      width:
                          MediaQuery.of(context).size.width *
                          0.05, // 10% chiều rộng màn hình
                      height:
                          MediaQuery.of(context).size.width *
                          0.05, // Giữ tỷ lệ vuông
                    ),
                  ),
                ),
              ),
              // ----------------------------------------------
              Align(
                alignment: Alignment(-0.5, 0.13),
                child: GestureDetector(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.07,
                    child: Container(
                      padding: EdgeInsets.all(
                        5,
                      ), // Đặt padding là 0 để TextField lấp đầy
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Row(
                        children: [
                          Expanded(
                            // Sử dụng Expanded để TextField lấp đầy không gian còn lại
                            child: TextField(
                              controller: kiaengineSpeedController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ), // Canh nội dung TextField
                                label: Text(
                                  "  RPM",
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
                              onSubmitted: (value) {
                                setState(() {
                                  final kiarpm = value;
                                  sendData(
                                    '1',
                                    'KIA_ENGINE_SPD',
                                    kiarpm.trim().toString(),
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.53, 0.85),
                child: GestureDetector(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.07,
                    child: Container(
                      padding: EdgeInsets.all(
                        5,
                      ), // Đặt padding là 0 để TextField lấp đầy
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Row(
                        children: [
                          Expanded(
                            // Sử dụng Expanded để TextField lấp đầy không gian còn lại
                            child: TextField(
                              controller: kiaengineTempController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ), // Canh nội dung TextField
                                label: Text(
                                  "  °C",
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
                              onSubmitted: (value) {
                                setState(() {
                                  final kiatemp = value;
                                  sendData(
                                    '1',
                                    'KIA_ENGINE_TEMP',
                                    kiatemp.trim().toString(),
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0, 0.2),
                child: GestureDetector(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.07,
                    child: Container(
                      padding: EdgeInsets.all(
                        5,
                      ), // Đặt padding là 0 để TextField lấp đầy
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Row(
                        children: [
                          Expanded(
                            // Sử dụng Expanded để TextField lấp đầy không gian còn lại
                            child: TextField(
                              controller: kiavehicleSpeedController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
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
                              onSubmitted: (value) {
                                setState(() {
                                  final kiaspeed = value;
                                  sendData(
                                    '1',
                                    'KIA_VEH_SPD',
                                    kiaspeed.trim().toString(),
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0, 0.35),
                child: GestureDetector(
                  child: Text(
                    "KIA MORNING",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.4),
                child: GestureDetector(
                  child: Text(
                    "2015",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),

              // ---------------------------------------------------------------
              Align(
                alignment: Alignment(
                  0.05,
                  0.81,
                ), // Điều chỉnh vị trí theo tỷ lệ
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      kiaisActive4 = !kiaisActive4;
                      if (kiaisActive4 == true) {
                        sendData('1', 'KIA_MIL', '02');
                      } else {
                        sendData('1', 'KIA_MIL', '00');
                      }
                    });
                  },
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      kiaisActive4 ? Colors.yellow : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/images/engine.png",
                      width:
                          MediaQuery.of(context).size.width *
                          0.031, // 10% chiều rộng màn hình
                      height: MediaQuery.of(context).size.width * 0.031,
                    ),
                  ),
                ),
              ),

              // ---------------------------------------------------------------
              Align(
                alignment: Alignment(
                  0.15,
                  -0.25,
                ), // Điều chỉnh vị trí theo tỷ lệ
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      kiaisActive6 = !kiaisActive6;
                      if (kiaisActive6 == true) {
                        sendData('1', 'KIA_TCS', '09');
                      } else {
                        sendData('1', 'KIA_TCS', '01');
                      }
                    });
                  },
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      kiaisActive6 ? Colors.yellow : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/images/esp.png",
                      width:
                          MediaQuery.of(context).size.width *
                          0.04, // 10% chiều rộng màn hình
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
              // ---------------------------------------------------------------
              Align(
                alignment: Alignment(0.2, -0.1), // Điều chỉnh vị trí theo tỷ lệ
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      kiaisActive7 = !kiaisActive7;
                      if (kiaisActive7 == true) {
                        sendData('1', 'KIA_MDPS', '01');
                      } else {
                        sendData('1', 'KIA_MDPS', '00');
                      }
                    });
                  },

                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      kiaisActive7 ? Colors.red : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/images/steering.png",
                      width:
                          MediaQuery.of(context).size.width *
                          0.031, // 10% chiều rộng màn hình
                      height: MediaQuery.of(context).size.width * 0.031,
                    ),
                  ),
                ),
              ),
              // ---------------------------------------------------------------
              Align(
                alignment: Alignment(
                  -0.35,
                  0.75,
                ), // Điều chỉnh vị trí theo tỷ lệ
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      kiaisActive8 = !kiaisActive8;
                      if (kiaisActive8 == true) {
                        sendData('1', 'KIA_TPMS', '03');
                      } else {
                        sendData('1', 'KIA_TPMS', '00');
                      }
                    });
                  },
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      kiaisActive8 ? Colors.yellow : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/images/tyrepressure.png",
                      width:
                          MediaQuery.of(context).size.width *
                          0.031, // 10% chiều rộng màn hình
                      height: MediaQuery.of(context).size.width * 0.031,
                    ),
                  ),
                ),
              ),
              // ---------------------------------------------------------------
              Align(
                alignment: Alignment(0.12, 0.8), // Điều chỉnh vị trí theo tỷ lệ
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      kiaisActive9 = !kiaisActive9;
                      if (kiaisActive9 == true) {
                        sendData('1', 'KIA_ABS', '13');
                      } else {
                        sendData('1', 'KIA_ABS', '08');
                      }
                    });
                  },
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      kiaisActive9 ? Colors.yellow : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      "assets/images/abs.png",
                      width:
                          MediaQuery.of(context).size.width *
                          0.031, // 10% chiều rộng màn hình
                      height: MediaQuery.of(context).size.width * 0.031,
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
