import 'package:flutter/material.dart';
import 'package:simulate_can/var.dart';

class UiMain extends StatefulWidget {
  const UiMain({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<UiMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tùy chỉnh AppBar với PreferredSize để có 2 hàng
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Chiều cao AppBar
        child: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 2,
          // flexibleSpace cho phép ta tùy biến nội dung AppBar
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                // ---- DÒNG 1: LOGO, SEARCH BAR, ACCOUNT ICON ----
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      // LOGO (thay đường dẫn logo của bạn)
                      Image.asset('assets/images/logo.png', height: 80),

                      const SizedBox(width: 20),

                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(titles.length, (index) {
                            return Expanded(
                              child: _buildNavItem(
                                title: titles[index],
                                iconData: iconData[index],
                                isSelected: selectedIndex == index,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                      // THANH TÌM KIẾM
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(color: Colors.grey[300]),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search...",
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.search),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Màu cam
                            foregroundColor: Colors.white, // Chữ trắng
                            shape: RoundedRectangleBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ), // Kích thước phù hợp
                          ),
                          child: Text(
                            'Search',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),
                      // BIỂU TƯỢNG ACCOUNT
                      IconButton(
                        icon: const Icon(
                          Icons.account_circle,
                          color: Colors.red,
                          size: 32,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: pages[selectedIndex],
    );
  }

  // Widget nút chuyển trang
  Widget _buildNavItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required IconData iconData,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Nếu chiều rộng của item < 100 thì chỉ hiện icon
          bool showText = constraints.maxWidth > 120;

          return Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: isSelected ? Colors.white : Colors.red,
                  size: 20,
                ),
                if (showText) ...[
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
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
