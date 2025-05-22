import 'package:flutter/material.dart';
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/Dashboard/KIA.png", // Thay bằng ảnh bảng đồng hồ của bạn
              fit: BoxFit.cover,
            ),
          ),
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
                          kiaisConnectedDashboard ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FittedBox(
                      child: Text(
                        kiaisConnectedDashboard ? 'Connected' : 'Disconnected',
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
                              kiaisConnectedDashboard = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 6),
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
                              kiaisConnectedDashboard = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Text('Off', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // --------------------------------------------------
          Align(
            alignment: Alignment(0.2, -0.22), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () {
                setState(() {
                  kiaisActive = !kiaisActive;
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
            alignment: Alignment(-0.315, -0.25), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () {
                setState(() {
                  kiaisActive2 = !kiaisActive2;
                  if (kiaisActive2 == true) {
                    sendData('1', 'LEFT', '40');
                  } else {
                    sendData('1', 'LEFT', '08');
                  }
                });
              },
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kiaisActive2 ? Colors.green : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/left.png",
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
            alignment: Alignment(0.315, -0.25), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () {
                setState(() {
                  kiaisActive3 = !kiaisActive3;
                  if (kiaisActive3 == true) {
                    sendData('1', 'RIGHT', '40');
                  } else {
                    sendData('1', 'RIGHT', '00');
                  }
                });
              },
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kiaisActive3 ? Colors.green : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/right.png",
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
            alignment: Alignment(0.05, 0.81), // Điều chỉnh vị trí theo tỷ lệ
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
            alignment: Alignment(0.1, -0.25), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => kiaisActive5 = !kiaisActive5),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kiaisActive5 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/seatbelt.png",
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
            alignment: Alignment(0.15, -0.25), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () {
                setState(() {
                  kiaisActive6 = !kiaisActive6;
                  if (kiaisActive6 == true) {
                    sendData('1', 'KIA_SBELT', '160');
                  } else {
                    sendData('1', 'KIA_SBELT', '00');
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
            alignment: Alignment(-0.35, 0.75), // Điều chỉnh vị trí theo tỷ lệ
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
                    sendData('1', 'KIA_ABS', '03');
                  } else {
                    sendData('1', 'KIA_ABS', '02');
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
          Align(
            alignment: Alignment(0.35, 0.75), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => kiaisActive10 = !kiaisActive10),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  kiaisActive10 ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/fuel.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.031, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.031,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
