import 'package:flutter/material.dart';

class FuseboxCivic2024 extends StatefulWidget {
  final String yearToDiagram;
  const FuseboxCivic2024({required this.yearToDiagram});

  @override
  State<FuseboxCivic2024> createState() => _FuseboxCivic2024State();
}

class _FuseboxCivic2024State extends State<FuseboxCivic2024> {
  String? _selectedText;

  final double imageOriginalWidth = 1920;
  final double imageOriginalHeight = 1080;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
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
        title: const Text("Fuse Box - Honda Civic 2024"),
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
                          'assets/images/fusebox/civic2024_fusebox1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 350,
                        fuseTop: 330,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '1',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'P/W DR',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 350,
                        fuseTop: 420,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '2',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'P/W AS',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 350,
                        fuseTop: 510,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '3',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'P/W RR R',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 350,
                        fuseTop: 600,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '4',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'P/W RR L',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 350,
                        fuseTop: 690,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '5',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'OPTION',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 275,
                        fuseTop: 780,
                        fuseWidth: 225,
                        fuseHeight: 80,
                        fuseNumber: '6',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'SRS',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 350,
                        fuseTop: 870,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '7',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'T/G MTR / TRUNK ACT',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 330,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '8',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 420,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '9',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'FR ACC SOCKET',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 510,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '10',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'DOOR LOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 600,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '11',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'METER',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 690,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '12',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'OPTION3 (ST CUT)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 780,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '13',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc:
                            'OPTION2 (RR WIP) [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 870,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '14',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'OPTION6 (VB SOL)',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 540,
                        fuseTop: 960,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '15',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'DR DOOR UNLOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 330,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '16',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'SUNROOF [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 420,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '17',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'SBW1 [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 510,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '18',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 600,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '19',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 690,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '20',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'RR FOG [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 780,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '21',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc:
                            'CARGO ACC SOCKET [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 870,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '22',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'SMART',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 730,
                        fuseTop: 960,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '23',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'DR DOOR LOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 330,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '24',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '7.5A',
                        fuseDesc: 'SBW2 [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 420,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '25',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'IMG',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 510,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '26',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'SRS',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 600,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '27',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'ACG/DN/ST CUT RLY',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 690,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '28',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'OPTION5',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 780,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '29',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'FUEL PUMP',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 870,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '30',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'L SIDE DOOR UNLOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 920,
                        fuseTop: 960,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '31',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'R SIDE DOOR UNLOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 330,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '32',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 420,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '33',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 510,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '34',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 600,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '35',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 690,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '36',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc:
                            'OPTION3 (SUNSHADE) [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 780,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '37',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '15A',
                        fuseDesc: 'IGA2 [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 870,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '38',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1110,
                        fuseTop: 960,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '39',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'R SIDE DOOR LOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 330,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '40',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc:
                            'P/SEAT REC / RR HI [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 420,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '41',
                        fuseType:
                            'P/SEAT SLIDE / FR HI [Not available on all models]',
                        fuseAmp: '20A',
                        fuseDesc: '',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 510,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '42',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '',
                        fuseDesc: '-',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 600,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '43',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'A/C',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 690,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '44',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'DRL',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 780,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '45',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'ACC',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 870,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '46',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'ACC KEY LOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1300,
                        fuseTop: 960,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '47',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'L SIDE DOOR LOCK',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1490,
                        fuseTop: 330,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '48',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'H/SEAT',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1490,
                        fuseTop: 420,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '49',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'AS P/SEAT REC [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1490,
                        fuseTop: 510,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '50',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'P/LUMBAR DR [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1490,
                        fuseTop: 600,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '51',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'P/LUMBAR AS [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1490,
                        fuseTop: 690,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '52',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'RR H/SEAT [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1490,
                        fuseTop: 780,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '53',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '20A',
                        fuseDesc: 'AS P/SEAT SLI [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1490,
                        fuseTop: 870,
                        fuseWidth: 150,
                        fuseHeight: 80,
                        fuseNumber: '54',
                        fuseType: 'Fuse MINI',
                        fuseAmp: '10A',
                        fuseDesc: 'OPTION1 / FUEL LID',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      buildFuseHighlightArea(
                        fuseLeft: 1170,
                        fuseTop: 20,
                        fuseWidth: 170,
                        fuseHeight: 210,
                        fuseNumber: '55',
                        fuseType: 'Fuse FMM/MCase',
                        fuseAmp: '30A',
                        fuseDesc: 'AUDIO AMP [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),
                      buildFuseHighlightArea(
                        fuseLeft: 1460,
                        fuseTop: 100,
                        fuseWidth: 170,
                        fuseHeight: 130,
                        fuseNumber: '56',
                        fuseType: 'Fuse FMM/MCase',
                        fuseAmp: '30A',
                        fuseDesc: 'ADS [Not available on all models]',
                        offsetX: offsetX,
                        offsetY: offsetY,
                        scale: scale,
                      ),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            "Interior Fuse Box",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Trang 2
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/fusebox/civic2024_fusebox2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            "Engine Compartment Fuse Box",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),

                      // Bạn có thể thêm vùng nhấn trang 2 ở đây
                    ],
                  ),

                  // Trang 3
                  Stack(
                    children: [
                      // Bạn có thể thêm vùng nhấn trang 3 ở đây
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
              if (_currentPage < 2)
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
                child: Container(color: Colors.black.withOpacity(0.4)),
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
