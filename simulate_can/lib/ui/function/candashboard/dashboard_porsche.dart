import 'package:flutter/material.dart';
import 'dart:ui'; // Để sử dụng BackdropFilter

class DashboardPorsche extends StatefulWidget {
  const DashboardPorsche({super.key});
  @override
  DashboardPorscheState createState() => DashboardPorscheState();
}

class DashboardPorscheState extends State<DashboardPorsche> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DASHBOARD SIMULATE - PORSCHE',
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
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Làm mờ ảnh
              child: Container(
                color: Colors.black.withAlpha(0), // Đảm bảo ảnh vẫn nhìn thấy
              ),
            ),
          ),
          Center(
            // Sử dụng Center để căn giữa khung chữ
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(
                  179,
                ), // Màu nền của khung chữ với độ mờ
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.update_outlined, size: 40),
                  Text(
                    'UPDATING...', // Chữ trong khung
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
