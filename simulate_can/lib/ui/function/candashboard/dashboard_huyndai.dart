import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardHuyndai extends StatefulWidget {
  const DashboardHuyndai({super.key});
  @override
  DashboardHuyndaiState createState() => DashboardHuyndaiState();
}

class DashboardHuyndaiState extends State<DashboardHuyndai> {
  void sendData(int addr, String field, int value) async {
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
          'DASHBOARD SIMULATE - HYUNDAI',
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
              "assets/images/Dashboard/HYUNDAI.png", // Thay bằng ảnh bảng đồng hồ của bạn
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
                          hyundaiisConnectedDashboard
                              ? Colors.green
                              : Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FittedBox(
                      child: Text(
                        hyundaiisConnectedDashboard
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
                              hyundaiisConnectedDashboard = true;
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
                              hyundaiisConnectedDashboard = false;
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
            alignment: Alignment(-0.47, 0.22), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () {
                setState(() {
                  hyundaiisActive11 = !hyundaiisActive11;
                });
              },
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive11 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/trunk.png",
                  width: MediaQuery.of(context).size.width * 0.06,
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
              ),
            ),
          ),

          // ---------------------------------------------------
          Align(
            alignment: Alignment(-0.52, 0.06),
            child: GestureDetector(
              onTap:
                  () => setState(() => hyundaiisActive10 = !hyundaiisActive10),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive10 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/abs.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height:
                      MediaQuery.of(context).size.height *
                      0.05, // Giữ tỷ lệ vuông
                ),
              ),
            ),
          ),
          // ----------------------------------------------
          Align(
            alignment: Alignment(-0.52, 0.5),
            child: GestureDetector(
              onTap:
                  () => setState(() => hyundaiisActive12 = !hyundaiisActive12),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive12 ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/esp.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height:
                      MediaQuery.of(context).size.height *
                      0.05, // Giữ tỷ lệ vuông
                ),
              ),
            ),
          ),

          // ----------------------------------------------
          Align(
            alignment: Alignment(-0.65, 0.5),
            child: GestureDetector(
              onTap:
                  () => setState(() => hyundaiisActive13 = !hyundaiisActive13),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive13 ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/esp_off.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height:
                      MediaQuery.of(context).size.height *
                      0.05, // Giữ tỷ lệ vuông
                ),
              ),
            ),
          ),

          // ----------------------------------------------
          Align(
            alignment: Alignment(-0.75, 0.6),
            child: GestureDetector(
              onTap:
                  () => setState(() => hyundaiisActive14 = !hyundaiisActive14),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive14 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/tyrepressure.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height:
                      MediaQuery.of(context).size.height *
                      0.05, // Giữ tỷ lệ vuông
                ),
              ),
            ),
          ),

          // ----------------------------------------------
          Align(
            alignment: Alignment(-0.01, 0),
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
                          controller: hyundaiengineSpeedController,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.01, -0.2),
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
                          controller: hyundaivehicleSpeedController,
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
          // Align(
          //             alignment: Alignment(0, 0.35),
          //             child: GestureDetector(
          //               child: Text(
          //                 "HYUNDAI ",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: MediaQuery.of(context).size.height * 0.025,
          //                   fontWeight: FontWeight.bold,
          //                   fontFamily: 'Roboto',
          //                 ),
          //               ),
          //             ),
          //           ),

          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.42, 0.6), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () {
                setState(() {
                  hyundaiisActive = !hyundaiisActive;
                  if (hyundaiisActive == true) {
                    sendData(1, 'MIL', 00);
                  } else {
                    sendData(1, 'MIL', 02);
                  }
                });
              },
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/engine.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.04, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0.42, 0.6), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap:
                  () => setState(() => hyundaiisActive15 = !hyundaiisActive15),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive15 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/fuel.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.06, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.25, -0.21), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive1 = !hyundaiisActive1),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive1 ? Colors.green : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/left.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.04, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0.22, -0.21), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive2 = !hyundaiisActive2),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive2 ? Colors.green : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/right.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.04, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.2, 0.59), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive3 = !hyundaiisActive3),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive3 ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/steering.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.04, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.12, 0.6), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive4 = !hyundaiisActive4),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive4 ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/engine_oil.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.04, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0, 0.59), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive6 = !hyundaiisActive6),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive6 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/doorwarning.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.035, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.06, 0.6), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive5 = !hyundaiisActive5),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive5 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/seatbelt.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0.06, 0.6), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive7 = !hyundaiisActive7),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive7 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/brake1.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.04, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0.12, 0.6), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive8 = !hyundaiisActive8),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive8 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/airbag.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0.18, 0.6), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => hyundaiisActive9 = !hyundaiisActive9),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hyundaiisActive9 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/battery.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.04, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
