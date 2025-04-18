import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Find the best solution together.",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We not only advise but also consider your thoughts to find the best solution for each car engine problem.",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Learn More",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cột trái (service boxes)
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                _buildServiceBox("Tech Development"),
                                const SizedBox(width: 20),
                                _buildServiceBox("Tech Development"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                _buildServiceBox("Tech Development"),
                                const SizedBox(width: 20),
                                _buildServiceBox("Tech Development"),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Cột phải (ảnh)
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AspectRatio(
                            aspectRatio:
                                2.5, // Hoặc dùng MediaQuery như bạn đang dùng
                            child: Container(
                              constraints: BoxConstraints(minHeight: 100),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/home.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceBox(String title) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool showText = constraints.maxWidth > 120;

          return Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueGrey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.build, color: Colors.red),
                if (showText) ...[
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
