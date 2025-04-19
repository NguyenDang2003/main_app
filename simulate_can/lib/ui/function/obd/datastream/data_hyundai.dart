import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

class DataHyundai extends StatefulWidget {
  const DataHyundai({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DataHyundaiState();
  }
}

class _DataHyundaiState extends State<DataHyundai> {
  // Cập nhật dữ liệu thay đổi ở backend để hiện thị lên giao diện
  void updateValue() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "DATA STREAM",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'CONNECTION',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isConnectedData
                            ? Colors.green
                            : Colors.red, // Màu nền theo trạng thái
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    isConnectedData ? 'Connected' : 'Disconnected',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Khoảng cách giữa trạng thái và nút
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Thực hiện kết nối
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Button vuông
                          ),
                        ),
                        child: const Text('Connect'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Ngắt kết nối
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Button vuông
                          ),
                        ),
                        child: const Text('Disconnect'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Khoảng cách hợp lý

                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey[300],
                  child: Text(
                    'VEHICLE OPERATING PARAMETERS',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                _buildVehicleDataRow("Shifter", shifter),
                const SizedBox(height: 20),
                _buildVehicleDataRow("Parking Break", parkingbreak),
                const SizedBox(height: 20),
                _buildVehicleDataRow("ACC/IG", accig),
                const SizedBox(height: 20),
                _buildVehicleDataRow("Engine Speed", '$enginespeed rpm'),
                const SizedBox(height: 20),
                _buildVehicleDataRow("Vehicle Speed", '$vehiclespeed km/h'),
                const SizedBox(height: 20),
                _buildVehicleDataRow("Coolant Temp", '$coolanttemp ℃'),
                const SizedBox(height: 20),
                _buildVehicleDataRow("Fuel", '$fuel L'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget hỗ trợ tạo mỗi dòng dữ liệu xe
  Widget _buildVehicleDataRow(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Viền đen
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ), // Căn lề
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn trái & phải
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          Text(
            value, // Dữ liệu từ backend
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
