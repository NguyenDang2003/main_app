import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

class SoftwareUpdate extends StatefulWidget {
  const SoftwareUpdate({super.key});

  @override
  State<SoftwareUpdate> createState() => _SoftwareUpdateState();
}

class _SoftwareUpdateState extends State<SoftwareUpdate> {
  String currentVersion = "Checking...";
  String updateStatus = "Not checked yet";
  String changelog = "";
  String downloadUrl = "";

  @override
  void initState() {
    super.initState();
    _getCurrentVersion();
  }

  Future<void> _getCurrentVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      currentVersion = info.version;
    });
  }

  Future<void> _checkForUpdate() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://nguyendang2003.github.io/update-software/update_info.json",
        ),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final latestVersion = data["latest_version"];
        changelog = data["changelog"];
        downloadUrl = data["download_url"];

        setState(() {
          updateStatus =
              latestVersion != currentVersion
                  ? "New version available: $latestVersion"
                  : "You are using the latest version.";
        });
      } else {
        setState(() {
          updateStatus = "Failed to check for updates.";
        });
      }
    } catch (e) {
      setState(() {
        updateStatus = "Connection error: $e";
      });
    }
  }

  // void _launchUpdateUrl() async {
  //   if (await canLaunchUrl(Uri.parse(downloadUrl))) {
  //     await launchUrl(
  //       Uri.parse(downloadUrl),
  //       mode: LaunchMode.externalApplication,
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Unable to open the update link.")),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: const Text(
          "Software Update",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current version: $currentVersion",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Update status: $updateStatus",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            if (changelog.isNotEmpty) ...[
              SizedBox(height: 20),
              Divider(height: 30),
              Text(
                "Update details:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  color: Colors.red.shade700,
                ),
              ),
              SizedBox(height: 10),
              Text(changelog, style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors
                          .red
                          .shade700, // Sử dụng backgroundColor thay vì primary
                ),
                child: Text(
                  "Download Update",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
            Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: _checkForUpdate,
                icon: Icon(Icons.refresh, color: Colors.white, size: 25),
                label: Text(
                  "Check for Updates",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors
                          .red
                          .shade700, // Sử dụng backgroundColor thay vì primary
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
