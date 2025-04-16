import 'package:flutter/material.dart';
import 'package:simulate_can/ui/function/obd/candoor/doors_hyundai.dart';
import 'package:simulate_can/ui/function/obd/datastream/data_hyundai.dart';

class ObdMain extends StatefulWidget {
  @override
  _ObdMainState createState() => _ObdMainState();
}

class _ObdMainState extends State<ObdMain> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OBD - HYUNDAI",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              // Trang 1
              DoorsHyundai(),

              // Trang 2
              DataHyundai(),
            ],
          ),

          // Nút sang trái (trang 2)
          if (_currentPage == 1)
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 40),
                color: Colors.grey[800],
                onPressed: _previousPage,
              ),
            ),

          // Nút sang phải (trang 1)
          if (_currentPage == 0)
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 40),
                color: Colors.grey[800],
                onPressed: _nextPage,
              ),
            ),
        ],
      ),
    );
  }
}
