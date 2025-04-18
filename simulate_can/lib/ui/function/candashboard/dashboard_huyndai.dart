import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

class DashboardHuyndai extends StatefulWidget {
  const DashboardHuyndai({super.key});
  @override
  DashboardHuyndaiState createState() => DashboardHuyndaiState();
}

class DashboardHuyndaiState extends State<DashboardHuyndai> {
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
              "assets/images/dashboard.png", // Thay bằng ảnh bảng đồng hồ của bạn
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
                      color: isConnectedDashboard ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FittedBox(
                      child: Text(
                        isConnectedDashboard ? 'Connected' : 'Disconnected',
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
                              isConnectedDashboard = true;
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
                              isConnectedDashboard = false;
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
            alignment: Alignment(-0.85, 0.5), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isActive = !isActive;
                });
              },
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/engine_oil.png",
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------
          Align(
            alignment: Alignment(-0.65, -0.1),
            child: GestureDetector(
              onTap: () => setState(() => isActive1 = !isActive1),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive1 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/brake.png",
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
            alignment: Alignment(-0.73, 0.65),
            child: GestureDetector(
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
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
                          controller: engineSpeedController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 8,
                            ), // Canh nội dung TextField
                            label: Text(
                              "RPM",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
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

          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.46, -0.52), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive2 = !isActive2),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive2 ? Colors.green : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/left.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0.44, -0.52), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive3 = !isActive3),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive3 ? Colors.green : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/right.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.88, 0.3), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive4 = !isActive4),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive4 ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/engine.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.9, 0.08), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive5 = !isActive5),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive5 ? Colors.yellow : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/tranmision.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.06, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.03, 0.37), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive6 = !isActive6),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive6 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/doorwarning.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.15, 0.37), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive7 = !isActive7),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive7 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/steering.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(0.08, 0.37), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive8 = !isActive8),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive8 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/tyrepressure.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
          // ---------------------------------------------------------------
          Align(
            alignment: Alignment(-0.8, -0.1), // Điều chỉnh vị trí theo tỷ lệ
            child: GestureDetector(
              onTap: () => setState(() => isActive9 = !isActive9),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive9 ? Colors.red : Colors.grey,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/abs.png",
                  width:
                      MediaQuery.of(context).size.width *
                      0.05, // 10% chiều rộng màn hình
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
