import 'package:flutter/material.dart';
import 'package:simulate_can/ui/cardoc.dart';
import 'package:simulate_can/ui/function/function_main.dart';
import 'ui/aboutus.dart';
import 'ui/online_service.dart';
import 'ui/home.dart';

import 'ui/cardoc/cardocaudi.dart';
import 'ui/cardoc/cardocbmw.dart';
import 'ui/cardoc/cardocchevrolet.dart';
import 'ui/cardoc/cardocford.dart';
import 'ui/cardoc/cardochonda.dart';
import 'ui/cardoc/cardochyundai.dart';
import 'ui/cardoc/cardocisuzu.dart';
import 'ui/cardoc/cardoclacetty.dart';
import 'ui/cardoc/cardocmercedes.dart';
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
import 'ui/cardoc/cardocmitsubishi.dart';

import 'ui/function/candashboard/dashboard_audi.dart';
import 'ui/function/candashboard/dashboard_bmw.dart';
import 'ui/function/candashboard/dashboard_chevrolet.dart';
import 'ui/function/candashboard/dashboard_ford.dart';
import 'ui/function/candashboard/dashboard_honda.dart';
import 'ui/function/candashboard/dashboard_huyndai.dart';
import 'ui/function/candashboard/dashboard_isuzu.dart';
import 'ui/function/candashboard/dashboard_lacetty.dart';
import 'ui/function/candashboard/dashboard_mercedes.dart';
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
double abs1 = 0;
double abs2 = 0;
double abs3 = 0;
double abs4 = 0;
double ana1 = 0;
double ana2 = 0;
double ana3 = 0;
double ana4 = 0;
TextEditingController teethController = TextEditingController();
TextEditingController gapteethController = TextEditingController();
TextEditingController indefteethController = TextEditingController();
TextEditingController exdefteethController = TextEditingController();
TextEditingController gap1teethController = TextEditingController();
TextEditingController gap11teethController = TextEditingController();
TextEditingController gap2teethController = TextEditingController();
TextEditingController gap22teethController = TextEditingController();
TextEditingController gap3teethController = TextEditingController();
TextEditingController gap33teethController = TextEditingController();
TextEditingController gap4teethController = TextEditingController();
TextEditingController gap44teethController = TextEditingController();
TextEditingController gap5teethController = TextEditingController();
TextEditingController gap55teethController = TextEditingController();
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
bool isConnectedDashboard = false;
// Biến cho đèn báo engine oil
bool isActive = false;
// Biến cho đèn báo phanh
bool isActive1 = false;
// Biến cho đèn nhan trái
bool isActive2 = false;
// Biến cho đèn nhanh phải
bool isActive3 = false;
// Biến cho đèn báo động cơ
bool isActive4 = false;
// Biến cho đèn báo hộp số
bool isActive5 = false;
// Biến cho đèn báo cửa
bool isActive6 = false;
// Biến cho đèn hệ thống lái
bool isActive7 = false;
// Biến cho đèn báo áp suất lốp
bool isActive8 = false;
// Biến cho đèn báo abs
bool isActive9 = false;
TextEditingController engineSpeedController = TextEditingController();

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
