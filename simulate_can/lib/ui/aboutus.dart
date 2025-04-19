import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Application Overview
                Text(
                  "Our application is designed to simulate automotive engine sensor signals while seamlessly integrating CAN bus communication and control. "
                  "With an intuitive user interface and robust features, users can monitor real-time data, control devices, and analyze vehicle systems efficiently. "
                  "Whether you're an automotive engineer, researcher, or enthusiast, our platform provides the essential tools needed for diagnostics and testing.",
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                SizedBox(height: 20),

                // Development Team
                Text(
                  "👨‍💻 Development Team",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "- DANG BUI CHI NGUYEN - Software Engineer",
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                Text(
                  "- NGUYEN DANG TAN PHAT - Automotive Communication Expert",
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                Text(
                  "- NGUYEN TAM NHAN - Embedded Systems Specialist",
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                SizedBox(height: 20),

                // Contact Information
                Text(
                  "📩 Contact Information",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Email: (To be updated)",
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                Text(
                  "GitHub: (To be updated)",
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                Text(
                  "Website: (To be updated)",
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                SizedBox(height: 20),

                // Application Version
                Text(
                  "📌 Application Version: Version 1.0.0",
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
