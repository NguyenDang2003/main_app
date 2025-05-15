import 'package:flutter/material.dart';
import 'package:simulate_can/ui/cardoc.dart';
import 'package:simulate_can/ui/cardoc/mitsubishit/fusebox/xpander/fusebox_xpander_2019.dart';
import 'package:simulate_can/ui/function/function_main.dart';
import 'ui/aboutus.dart';
import 'ui/online_service.dart';
import 'ui/home.dart';

import 'ui/cardoc/cardocaudi.dart';
import 'ui/cardoc/cardocbmw.dart';
import 'ui/cardoc/cardocchevrolet.dart';
import 'ui/cardoc/cardocford.dart';
import 'ui/cardoc/honda/cardochonda.dart';
import 'ui/cardoc/cardochyundai.dart';
import 'ui/cardoc/cardocisuzu.dart';
import 'ui/cardoc/cardoclacetty.dart';
import 'ui/cardoc/cardocmercedes.dart';
import 'ui/cardoc/cardockia.dart';
import 'ui/cardoc/cardocsubaru.dart';
import 'ui/cardoc/cardocsuzuki.dart';
import 'ui/cardoc/cardoctoyota.dart';
import 'ui/cardoc/cardocvolkswagen.dart';
import 'ui/cardoc/cardocvolvo.dart';
import 'ui/cardoc/cardoclandrover.dart';
import 'ui/cardoc/cardocmazda.dart';
import 'ui/cardoc/cardocporsche.dart';
import 'ui/cardoc/cardocmg.dart';
import 'ui/cardoc/cardocminicooper.dart';
import 'ui/cardoc/cardocnissan.dart';
import 'ui/cardoc/cardocjeep.dart';
import 'ui/cardoc/mitsubishit/cardocmitsubishi.dart';

import 'ui/function/candashboard/dashboard_audi.dart';
import 'ui/function/candashboard/dashboard_bmw.dart';
import 'ui/function/candashboard/dashboard_chevrolet.dart';
import 'ui/function/candashboard/dashboard_ford.dart';
import 'ui/function/candashboard/dashboard_honda.dart';
import 'ui/function/candashboard/dashboard_huyndai.dart';
import 'ui/function/candashboard/dashboard_isuzu.dart';
import 'ui/function/candashboard/dashboard_lacetty.dart';
import 'ui/function/candashboard/dashboard_mercedes.dart';
import 'ui/function/candashboard/dashboard_kia.dart';
import 'ui/function/candashboard/dashboard_subaru.dart';
import 'ui/function/candashboard/dashboard_suzuki.dart';
import 'ui/function/candashboard/dashboard_toyota.dart';
import 'ui/function/candashboard/dashboard_volkswagen.dart';
import 'ui/function/candashboard/dashboard_volvo.dart';
import 'ui/function/candashboard/dashboard_landrover.dart';
import 'ui/function/candashboard/dashboard_mazda.dart';
import 'ui/function/candashboard/dashboard_porsche.dart';
import 'ui/function/candashboard/dashboard_mg.dart';
import 'ui/function/candashboard/dashboard_minicooper.dart';
import 'ui/function/candashboard/dashboard_nissan.dart';
import 'ui/function/candashboard/dashboard_jeep.dart';
import 'ui/function/candashboard/dashboard_mitsubishi.dart';

import 'ui/function/obd/candoor/doors_hyundai.dart';

import 'ui/cardoc/comparisionpage.dart';
import 'ui/cardoc/fuseboxyearpage.dart';
import 'ui/cardoc/ownerreviewpage.dart';
import 'ui/cardoc/pdfmanuallistpage.dart';
import 'ui/cardoc/usefulguidespage.dart';

import 'ui/cardoc/honda/fusebox/civic/fusebox_civic_2024.dart';

// Biến của main_ui
int selectedIndex = 0;

final List<String> titles = [
  "HOME",
  "FUNCTIONS",
  "ABOUT US",
  "ONLINE SERVICE",
  "CARDOC",
];
final List<IconData> iconData = [
  Icons.home,
  Icons.functions_sharp,
  Icons.perm_device_information,
  Icons.network_wifi_outlined,
  Icons.edit_document,
];

final List<Widget> pages = [
  Home(),
  FunctionMain(),
  AboutUsPage(),
  OnlineService(),
  Cardoc(),
];

// Biến dùng cho door
bool isConnectedCarDoor = false;
// Biến dùng cho simulate
bool isSending = false;
double crankValue = 1500;

TextEditingController teethabsController = TextEditingController();
double abs1 = 0;
double abs2 = 0;
double abs3 = 0;
double abs4 = 0;

double ana1 = 0;
double ana2 = 0;
double ana3 = 0;
double ana4 = 0;
double ana5 = 0;
double ana6 = 0;

double actua1 = 0;
double actua2 = 0;
double actua3 = 0;
double actua4 = 0;

TextEditingController teethController = TextEditingController();
TextEditingController gapteethController = TextEditingController();
TextEditingController numCampInducteethController = TextEditingController();
TextEditingController difInCampCrkInducController = TextEditingController();
TextEditingController difExCampCrkInducController = TextEditingController();
TextEditingController numCampHallteethController = TextEditingController();
TextEditingController difInCampCrkHallController = TextEditingController();
TextEditingController difExCampCrkHallController = TextEditingController();
TextEditingController teeth1widthController = TextEditingController();
TextEditingController gap1widthController = TextEditingController();
TextEditingController teeth2widthController = TextEditingController();
TextEditingController gap2widthController = TextEditingController();
TextEditingController teeth3widthController = TextEditingController();
TextEditingController gap3widthController = TextEditingController();
TextEditingController teeth4widthController = TextEditingController();
TextEditingController gap4widthController = TextEditingController();
TextEditingController teeth5widthController = TextEditingController();
TextEditingController gap5widthController = TextEditingController();
TextEditingController teeth6widthController = TextEditingController();
TextEditingController gap6widthController = TextEditingController();
TextEditingController teeth7widthController = TextEditingController();
TextEditingController gap7widthController = TextEditingController();
TextEditingController teeth8widthController = TextEditingController();
TextEditingController gap8widthController = TextEditingController();
// Biến dùng cho DataStream
bool isConnectedData = false;
String shifter = 'P';
String parkingbreak = 'OFF';
String accig = 'OFF';
double enginespeed = 0;
double vehiclespeed = 0;
double coolanttemp = 0;
double fuel = 0;

// Biến dùng cho carbrand
final List<Map<String, String>> carBrands = [
  {'image': 'assets/images/carbrand/audi.png', 'name': 'AUDI'},
  {'image': 'assets/images/carbrand/bmw.png', 'name': 'BMW'},
  {'image': 'assets/images/carbrand/chevrolet.png', 'name': 'CHEVROLET'},
  {'image': 'assets/images/carbrand/ford.png', 'name': 'FORD'},
  {'image': 'assets/images/carbrand/honda.png', 'name': 'HONDA'},
  {'image': 'assets/images/carbrand/hyundai.png', 'name': 'HYUNDAI'},
  {'image': 'assets/images/carbrand/isuzu.png', 'name': 'ISUZU'},
  {'image': 'assets/images/carbrand/lacetty.png', 'name': 'LACETTY'},
  {'image': 'assets/images/carbrand/merc.png', 'name': 'MERCEDES'},
  {'image': 'assets/images/carbrand/kia.png', 'name': 'KIA'},
  {'image': 'assets/images/carbrand/subaru.png', 'name': 'SUBARU'},
  {'image': 'assets/images/carbrand/suzuki.png', 'name': 'SUZUKI'},
  {'image': 'assets/images/carbrand/toyota.png', 'name': 'TOYOTA'},
  {'image': 'assets/images/carbrand/volkswagen.png', 'name': 'VOLKSWAGEN'},
  {'image': 'assets/images/carbrand/volvo.png', 'name': 'VOLVO'},
  {'image': 'assets/images/carbrand/landrover.png', 'name': 'LAND ROVER'},
  {'image': 'assets/images/carbrand/mazda.png', 'name': 'MAZDA'},
  {'image': 'assets/images/carbrand/porsche.png', 'name': 'PORSCHE'},
  {'image': 'assets/images/carbrand/mg.png', 'name': 'MG'},
  {'image': 'assets/images/carbrand/minicooper.png', 'name': 'MINICOOPER'},
  {'image': 'assets/images/carbrand/nissan.png', 'name': 'NISSAN'},
  {'image': 'assets/images/carbrand/jeep.png', 'name': 'JEEP'},
  {'image': 'assets/images/carbrand/mitsubishi.png', 'name': 'MISUBISHI'},
];

final List<Widget> dashboardcarScreens = [
  DashboardAudi(),
  DashboardBmw(),
  DashboardChevrolet(),
  DashboardFord(),
  DashboardHonda(),
  DashboardHuyndai(),
  DashboardIsuzu(),
  DashboardLacetty(),
  DashboardMercedes(),
  DashboardKia(),
  DashboardSubaru(),
  DashboardSuzuki(),
  DashboardToyota(),
  DashboardVolkswagen(),
  DashboardVolvo(),
  DashboardLandrover(),
  DashboardMazda(),
  DashboardPorsche(),
  DashboardMg(),
  DashboardMinicooper(),
  DashboardNissan(),
  DashboardJeep(),
  DashboardMitsubishi(),
];

final List<Widget> doorscarScreens = [
  // AudiScreen(),
  // BmwScreen(),
  // ChevroletScreen(),
  // FordScreen(),
  // HondaScreen(),
  DoorsHyundai(),
  // IsuzuScreen(),
  // LacettyScreen(),
  // MercedesScreen(),
  // SubaruScreen(),
  // SuzukiScreen(),
  // ToyotaScreen(),
  // VolkswagenScreen(),
  // VolvoScreen(),
  // LandRoverScreen(),
  // MazdaScreen(),
  // PorscheScreen(),
  // MgScreen(),
  // MiniCooperScreen(),
  // NissanScreen(),
  // JeepScreen(),
  // MitsubishiScreen(),
];
// Biến dùng cho Hyundai Dashboard

// Biến dùng cho dashboard
bool hyundaiisConnectedDashboard = false;
// Biến cho đèn báo engine
bool hyundaiisActive = true;
// Biến cho đèn nhan trái
bool hyundaiisActive1 = false;
// Biến cho đèn nhan phải
bool hyundaiisActive2 = false;
// Biến cho đèn hệ thống lái
bool hyundaiisActive3 = true;
// Biến cho đèn báo dầu động cơ
bool hyundaiisActive4 = false;
// Biến cho đèn báo seatbelt
bool hyundaiisActive5 = false;
// Biến cho đèn báo cửa
bool hyundaiisActive6 = false;
// Biến cho đèn phanh tay
bool hyundaiisActive7 = true;
// Biến cho đèn báo airbag
bool hyundaiisActive8 = false;
// Biến cho đèn báo battery
bool hyundaiisActive9 = false;
// Biến cho đèn báo abs
bool hyundaiisActive10 = true;
// Biến cho đèn báo mở cốp sau
bool hyundaiisActive11 = false;
// Biến cho đèn báo esp on
bool hyundaiisActive12 = true;
// Biến cho đèn báo esp off
bool hyundaiisActive13 = false;
// Biến cho đèn báo áp suất lốp
bool hyundaiisActive14 = true;
// Biến cho đèn báo nhiên liệu
bool hyundaiisActive15 = false;

TextEditingController hyundaiengineSpeedController = TextEditingController();
TextEditingController hyundaivehicleSpeedController = TextEditingController();

// Biến dùng cho Hyundai Dashboard

// Biến dùng cho dashboard
bool kiaisConnectedDashboard = false;
// Biến cho đèn báo engine oil
bool kiaisActive = false;
// Biến cho đèn báo phanh
bool kiaisActive1 = false;
// Biến cho đèn nhan trái
bool kiaisActive2 = false;
// Biến cho đèn nhanh phải
bool kiaisActive3 = false;
// Biến cho đèn báo động cơ
bool kiaisActive4 = true;
// Biến cho đèn báo seat belt
bool kiaisActive5 = false;
// Biến cho đèn esp cân bằng điện tử on
bool kiaisActive6 = true;
// Biến cho đèn hệ thống lái
bool kiaisActive7 = true;
// Biến cho đèn báo áp suất lốp
bool kiaisActive8 = true;
// Biến cho đèn báo abs
bool kiaisActive9 = true;
// Biến cho đèn báo fuel
bool kiaisActive10 = false;

TextEditingController kiaengineSpeedController = TextEditingController();
TextEditingController kiavehicleSpeedController = TextEditingController();

// Biến dùng cho Ford Dashboard

// Biến dùng cho Car doc
final List<Widget> cardocScreens = [
  CardocAudiScreen(),
  CardocBmwScreen(),
  CardocChevroletScreen(),
  CardocFordScreen(),
  CardocHondaScreen(),
  CardocHyundaiScreen(),
  CardocIsuzuScreen(),
  CardocLacettyScreen(),
  CardocMercedesScreen(),
  CardocKiaScreen(),
  CardocSubaruScreen(),
  CardocSuzukiScreen(),
  CardocToyotaScreen(),
  CardocVolkswagenScreen(),
  CardocVolvoScreen(),
  CardocLandRoverScreen(),
  CardocMazdaScreen(),
  CardocPorscheScreen(),
  CardocMgScreen(),
  CardocMiniCooperScreen(),
  CardocNissanScreen(),
  CardocJeepScreen(),
  CardocMitsubishiScreen(),
];
//Các loại xe từng hãng
final carData = {
  "HONDA": {
    "Civic": {
      "reviews": [
        {
          "title": "My 2020 Civic after 3 years",
          "content": "Still drives like new!",
        },
        {
          "title": "Fuel efficiency surprised me",
          "content": "I consistently get 35 mpg.",
        },
      ],
      "manuals": {
        "2020": "assets/honda/civic/2020_manual.pdf",
        "2021": "assets/honda/civic/2021_manual.pdf",
        "2022": "assets/honda/civic/2022_manual.pdf",
      },

      "useful_guides": {
        "Maintenance Tips": {
          "Oil Change": "assets/honda/civic/guides/oil_change.pdf",
          "Brake Check": "assets/honda/civic/guides/brake_check.pdf",
        },
        "How to use dashboard": {
          "Infotainment": "assets/honda/civic/guides/infotainment.pdf",
        },
      },
      "fuse_box": {
        "2024":
            (final String yearToDiagram) => FuseboxCivic2024(
              yearToDiagram: "2024",
            ), // Dùng để load UI riêng
        "2022": "diagram_2021",
        "2021": "diagram_2021",
        "2020": "diagram_2021",
        "2019": "diagram_2021",
      },
      "comparisons": [
        {"with": "Toyota Corolla 2021", "id": "compare_civic_corolla2021"},
        {"with": "Mazda 3 2020", "id": "compare_civic_mazda32020"},
      ],
    },
  },
  "MITSUBISHI": {
    "Xpander": {
      "reviews": [
        {
          "title": "My 2010 Civic after 3 years",
          "content": "Still drives like new!",
        },
        {
          "title": "Fuel efficiency surprised me",
          "content": "I consistently get 35 mpg.",
        },
      ],
      "manuals": {
        "2018": "assets/mitsubishi/xpander/2018_manual.pdf",
        "2019": "assets/mitsubishi/xpander/2019_manual.pdf",
        "2010": "assets/mitsubishi/xpander/2020_manual.pdf",
      },

      "useful_guides": {
        "Maintenance Tips": {
          "Oil Change": "assets/mitsubishi/xpander/guides/oil_change.pdf",
          "Brake Check": "assets/mitsubishi/xpander/guides/brake_check.pdf",
        },
        "How to use dashboard": {
          "Infotainment": "assets/mitsubishi/xpander/guides/infotainment.pdf",
        },
      },
      "fuse_box": {
        "2019":
            (final String yearToDiagram) => FuseboxMitsubishi2019(
              yearToDiagram: "2019",
            ), // Dùng để load UI riêng
        "2018": "diagram_2021",
        "2020": "diagram_2021",
        "2021": "diagram_2021",
        "2022": "diagram_2021",
      },
      "comparisons": [
        {"with": "Toyota Corolla 2021", "id": "compare_xpander_corolla2021"},
        {"with": "Mazda 3 2020", "id": "compare_xpander_mazda32020"},
      ],
    },
  },
};

final List<Map<String, dynamic>> carDocSections = [
  {
    'id': 'useful_guides',
    'title': 'Useful Guides',
    'widget':
        (String carBrand, String carName, dynamic data) => UsefulGuidesPage(
          carBrand: carBrand,
          carName: carName,
          guideSections: data,
        ),
  },
  {
    'id': 'manuals',
    'title': 'Owner\'s Manuals',
    'widget':
        (String carBrand, String carName, dynamic data) => PDFManualListPage(
          carBrand: carBrand,
          carName: carName,
          section: 'Owner\'s Manuals',
          yearToPdf: data,
        ),
  },
  {
    'id': 'reviews',
    'title': 'Owner\'s Reviews',
    'widget':
        (String carBrand, String carName, dynamic data) => OwnerReviewsPage(
          carBrand: carBrand,
          carName: carName,
          reviews: data,
        ),
  },
  {
    'id': 'fuse_box',
    'title': 'Fuse Box Diagrams',
    'widget':
        (String carBrand, String carName, dynamic data) => FuseBoxYearPage(
          carBrand: carBrand,
          carName: carName,
          yearToDiagram: data,
        ),
  },
  {
    'id': 'comparisons',
    'title': 'Comparisons',
    'widget':
        (String carBrand, String carName, dynamic data) => ComparisonPage(
          carBrand: carBrand,
          carName: carName,
          comparisons: data,
        ),
  },
];

final List<String> sections = [
  "Owner's reviews",
  "Owner's Manuals",
  "Service and Repair Manuals",
  "Useful guides",
  "Fuse box diagrams",
  "Comparisons",
];

final List<String> carHonda = [
  'Accord',
  'Accord Hybrid',
  'ACTY',
  'Amaze',
  'City',
  'Civic',
  'Civic Hybrid',
  'Clarity FCV',
  'Clarity Plug-In',
  'CR-V',
  'CR-V Hybrid',
  'CR-X',
  'CR-Z',
  'Crosstour',
  'CRX',
  'E',
  'Element',
  'Elysion',
  'Fit',
  'Fit EV',
  'FR-V',
  'Freed',
  'HR-V',
  'Insight',
  'Integra',
  'Jazz',
  'Legend',
  'MDX',
  'Mobilio Spike',
  'NSX',
  'Odyssey',
  'Passport',
  'Pilot',
  'Prelude',
  'Prologue',
  'Ridgeline',
  'S2000',
  'Stepwagon',
];
final List<String> carMitsubishi = [
  '3000GT',
  '380',
  'ASX',
  'Challenger',
  'Colt',
  'Delica',
  'Diamante',
  'Eclipse',
  'Eclipse Cross',
  'Endeavor',
  'Express',
  'Galant',
  'Grandis',
  'i-MiEV',
  'L200',
  'Lancer',
  'Lancer Evolution',
  'Magna',
  'Mirage',
  'Montero',
  'Outlander',
  'Outlander PHEV',
  'Pajero',
  'Pinin',
  'Xpander',
];

final List<String> yearAudi = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearBmw = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearChevrolet = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearFord = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearHonda = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearHyundai = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearIsuzu = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearLacetty = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearMercedes = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearKia = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearSubaru = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearSuzuki = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearToyota = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearVolkswagen = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearVolvo = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearLandrover = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearMazda = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearPorsche = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearMg = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearMinicooper = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearNissan = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
final List<String> yearJeep = ['2001', '2002', '2003', '2004', '2005', '2007'];
final List<String> yearMitsubishi = [
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
];
