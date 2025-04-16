import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PdfFromUrlScreen extends StatefulWidget {
  final String pdfUrl;

  const PdfFromUrlScreen({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _PdfFromUrlScreenState createState() => _PdfFromUrlScreenState();
}

class _PdfFromUrlScreenState extends State<PdfFromUrlScreen> {
  late String filePath;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  Future<void> loadDocument() async {
    try {
      // Chuyển đổi URL Google Drive thành URL tải trực tiếp
      String downloadUrl = widget.pdfUrl.replaceFirst(
        "https://drive.google.com/file/d/",
        "https://drive.google.com/uc?export=download&id=",
      );

      // Tải PDF từ URL dưới dạng byte
      final response = await http.get(Uri.parse(downloadUrl));
      if (response.statusCode == 200) {
        // Lưu dữ liệu PDF vào tệp tạm thời
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/temp.pdf');
        await file.writeAsBytes(response.bodyBytes);

        setState(() {
          filePath = file.path;
          isLoading = false;
        });
      } else {
        throw Exception("Không thể tải file PDF");
      }
    } catch (e) {
      print("Lỗi khi load PDF: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Không thể tải file PDF")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tài liệu kỹ thuật")),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : PDFView(
                filePath: filePath, // Truyền đường dẫn tệp PDF
              ),
    );
  }
}
