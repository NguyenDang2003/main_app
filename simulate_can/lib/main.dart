import 'package:flutter/material.dart';
import 'package:simulate_can/ui/ui_main.dart';
import 'package:window_manager/window_manager.dart';

// import 'package:process_run/process_run.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setMinimumSize(const Size(800, 450));
    await windowManager.setSize(const Size(800, 450)); // Đặt kích thước ban đầu
    windowManager.setAspectRatio(16 / 9);
    await windowManager.setResizable(true);
    await windowManager.show();
  });

  // Chạy backend khi app khởi động
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: UiMain());
  }
}
