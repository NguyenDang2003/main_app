import 'package:flutter/material.dart';

class FuseboxMitsubishi2019 extends StatefulWidget {
  final String yearToDiagram;
  const FuseboxMitsubishi2019({required this.yearToDiagram});

  @override
  State<FuseboxMitsubishi2019> createState() => _FuseboxMitsubishi2019State();
}

class _FuseboxMitsubishi2019State extends State<FuseboxMitsubishi2019> {
  String? _selectedText;

  final double imageOriginalWidth = 1920;
  final double imageOriginalHeight = 1080;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Fuse Box - Mitsubishi Xpander 2019"),
        centerTitle: true,
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
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                    _selectedText = null; // reset overlay khi đổi trang
                  });
                },
                children: [
                  // Trang 1
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/fusebox/xpander2019_fusebox.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1170,
                        fuseTop: 45,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: '#1',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '25A',
                        fuseDesc: 'Spare fuse',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1170,
                        fuseTop: 95,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: '#2',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'Spare fuse',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 1075,
                        fuseTop: 200,
                        fuseWidth: 100,
                        fuseHeight: 100,
                        fuseNumber: 'SBF1',
                        fuseType: 'Fuse FMX/JCase',
                        fuseAmp: '40A',
                        fuseDesc: 'Ignition switch',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 975,
                        fuseTop: 200,
                        fuseWidth: 100,
                        fuseHeight: 100,
                        fuseNumber: 'SBF2',
                        fuseType: 'Fuse FMX/JCase',
                        fuseAmp: '30A',
                        fuseDesc: 'Electric window control',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 775,
                        fuseTop: 725,
                        fuseWidth: 100,
                        fuseHeight: 100,
                        fuseNumber: 'SBF4',
                        fuseType: 'Fuse FMX/JCase',
                        fuseAmp: '40A',
                        fuseDesc: 'Anti-lock braking system',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 775,
                        fuseTop: 625,
                        fuseWidth: 100,
                        fuseHeight: 100,
                        fuseNumber: 'SBF3',
                        fuseType: 'Fuse FMX/JCase',
                        fuseAmp: '30A',
                        fuseDesc: 'Anti-lock braking system',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 1080,
                        fuseTop: 325,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F1',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '-',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1080,
                        fuseTop: 365,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F2',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Hazard warn- ing flasher',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1080,
                        fuseTop: 405,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F3',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '7.5A',
                        fuseDesc: 'Starter',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1080,
                        fuseTop: 485,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F4',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'Automatic transmission',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1080,
                        fuseTop: 530,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F5',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '-',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 970,
                        fuseTop: 325,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F9',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '7.5A',
                        fuseDesc: 'Alternator',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 970,
                        fuseTop: 365,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F10',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'ETV',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 970,
                        fuseTop: 405,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F11',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Air condition- ing',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 970,
                        fuseTop: 485,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F12',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '7.5A',
                        fuseDesc: 'Engine control',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 970,
                        fuseTop: 530,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F13',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Stop lamps (Brake lamps)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 1090,
                        fuseTop: 760,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F6',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '-',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1090,
                        fuseTop: 805,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F7',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '-',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1090,
                        fuseTop: 850,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F8',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '-',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 990,
                        fuseTop: 765,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F14',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'Fuel pump',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 990,
                        fuseTop: 810,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F15',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'ENG/POWER',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 820,
                        fuseTop: 315,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F16',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '-',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 820,
                        fuseTop: 360,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F17',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'Fog lamps',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 820,
                        fuseTop: 405,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F18',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Daytime running lamps',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 820,
                        fuseTop: 445,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F19',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'Horn',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 710,
                        fuseTop: 315,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F22',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '-',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 710,
                        fuseTop: 405,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F23',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Headlamp high beam (right)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 710,
                        fuseTop: 445,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F24',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Headlamp high beam (left)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 660,
                        fuseTop: 195,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F20',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Headlamp low beam (right)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 660,
                        fuseTop: 235,
                        fuseWidth: 100,
                        fuseHeight: 40,
                        fuseNumber: 'F21',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'Headlamp low beam (left)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 1180,
                        fuseTop: 205,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R1',
                        fuseType: 'Relay',
                        fuseAmp: 'A-16X',
                        fuseDesc: 'Throttle valve control servo relay',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1180,
                        fuseTop: 343,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R2',
                        fuseType: 'Relay',
                        fuseAmp: 'A-15X',
                        fuseDesc: 'Starter relay',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1192,
                        fuseTop: 469,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R3',
                        fuseType: 'Relay',
                        fuseAmp: 'A-14X',
                        fuseDesc: 'Cooling fan control relay (LO)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1180,
                        fuseTop: 589,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R4',
                        fuseType: 'Relay',
                        fuseAmp: 'A-13X',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 1200,
                        fuseTop: 733,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R5',
                        fuseType: 'Relay',
                        fuseAmp: 'A-12X',
                        fuseDesc: 'Power window relay',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1208,
                        fuseTop: 868,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R6',
                        fuseType: 'Relay',
                        fuseAmp: 'A-11X',
                        fuseDesc: 'A/C compressor relay',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 960,
                        fuseTop: 630,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R7',
                        fuseType: 'Relay',
                        fuseAmp: 'A-10X',
                        fuseDesc: 'Engine control relay',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 745,
                        fuseTop: 515,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R10',
                        fuseType: 'Relay',
                        fuseAmp: 'A-09X',
                        fuseDesc: 'Headlamp relay (HI)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 747,
                        fuseTop: 165,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R9',
                        fuseType: 'Relay',
                        fuseAmp: 'A-08X',
                        fuseDesc: 'Headlamp relay (LO)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 720,
                        fuseTop: 45,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R8',
                        fuseType: 'Relay',
                        fuseAmp: 'A-07X',
                        fuseDesc: 'Horn relay',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 45,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R11',
                        fuseType: 'Relay',
                        fuseAmp: 'A-06X',
                        fuseDesc: 'Front fog lamp relay',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 495,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R12',
                        fuseType: 'Relay',
                        fuseAmp: 'A-05X',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 625,
                        fuseWidth: 170,
                        fuseHeight: 100,
                        fuseNumber: 'R13',
                        fuseType: 'Relay',
                        fuseAmp: 'A-04X',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 545,
                        fuseTop: 785,
                        fuseWidth: 170,
                        fuseHeight: 300,
                        fuseNumber: 'R14',
                        fuseType: 'Relay',
                        fuseAmp: 'A-03X',
                        fuseDesc: 'Cooling fan control relay (HI)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                    ],
                  ),

                  // Trang 2
                  Stack(children: [
                    ],
                  ),
                ],
              ),

              // Nút lùi trang
              if (_currentPage > 0)
                Positioned(
                  left: 10,
                  top: MediaQuery.of(context).size.height / 2 - 25,
                  child: FloatingActionButton(
                    onPressed: _prevPage,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    mini: true,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),

              // Nút tới trang
              if (_currentPage < 1)
                Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height / 2 - 25,
                  child: FloatingActionButton(
                    onPressed: _nextPage,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    mini: true,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  /// Hàm tổng quát để tạo vùng nhấn và overlay
  Widget buildFuseHighlightArea({
    required double fuseLeft,
    required double fuseTop,
    required double fuseWidth,
    required double fuseHeight,
    required String fuseNumber,
    required String fuseType,
    required String fuseAmp,
    required String fuseDesc,
    required double offsetX,
    required double offsetY,
    required double scale,
  }) {
    final selectedKey = "$fuseNumber$fuseType$fuseAmp$fuseDesc";

    return Stack(
      children: [
        // Vùng nhấn
        Positioned(
          left: offsetX + fuseLeft * scale,
          top: offsetY + fuseTop * scale,
          width: fuseWidth * scale,
          height: fuseHeight * scale,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedText = selectedKey;
              });
            },
            child: Container(color: Colors.transparent),
          ),
        ),

        // Nếu được chọn, hiển thị lớp mờ và nội dung
        if (_selectedText == selectedKey) ...[
          // Overlay mờ ngoài vùng nhấn
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedText = null;
                });
              },
              child: ClipPath(
                clipper: HoleClipper(
                  Rect.fromLTWH(
                    offsetX + fuseLeft * scale,
                    offsetY + fuseTop * scale,
                    fuseWidth * scale,
                    fuseHeight * scale,
                  ),
                ),
                child: Container(color: const Color.fromRGBO(0, 0, 0, 0.6)),
              ),
            ),
          ),

          // Hộp thông tin kiểu mới
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        fuseNumber,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        fuseType,
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: Text(
                          fuseAmp,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(fuseDesc, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class HoleClipper extends CustomClipper<Path> {
  final Rect hole;

  HoleClipper(this.hole);

  @override
  Path getClip(Size size) {
    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    path.addRect(hole);
    return Path.combine(PathOperation.difference, path, Path()..addRect(hole));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
