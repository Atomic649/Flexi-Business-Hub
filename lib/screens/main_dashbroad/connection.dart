import 'package:flutter/material.dart';
import 'package:flutter_node_store/connection_tap/business_message.dart';
import 'package:flutter_node_store/connection_tap/business_gemini.dart';
import 'package:flutter_node_store/connection_tap/business_news.dart';
import 'package:flutter_node_store/connection_tap/business_profile.dart';
import 'package:flutter_node_store/connection_tap/business_shop.dart';
import 'package:flutter_node_store/themes/colors.dart';

class Connection extends StatefulWidget {
  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  //ส่วนของการสร้าง Bottom Navigation Bar
  // สร้างตัวแปรเก็บ title ของแต่ละหน้า

  // สร้างตัวแปรเก็บ index ของแต่ละหน้า
  int _currentIndex = 0;

  // สร้าง List ของแต่ละหน้า
  final List<Widget> _children = [
    const BusinessProfile(),
    BusinessNews(),
    BusinessConnections(),
    const BusinessGemini(),
    const BusinessShop(),

  ];

  //------- ฟังก์ขันในการเปลี่ยนหน้า โดยรับค่า index จากการกดที่ bottomNavigationBar------//

  void onTabTapped(int index) {
    setState(
      () {
        _currentIndex = index;
        switch (index) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
          case 4:
            break;
          case 5:
            break;
          default:
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color(0xff7300ff), Color(0xff1100ff)],
                    stops: [0.15, 0.75],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ))),
          BottomNavigationBar(
              backgroundColor: Colors.transparent,
              onTap: (value) {
                onTabTapped(value);
              },
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF1CFF67),
              selectedLabelStyle: const TextStyle(color: Color(0xFF004CFF)),
              unselectedItemColor: secondaryText,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper_outlined),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.messenger_outline_sharp),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.gpp_good_outlined),
                  label: 'Gemini',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_outlined),
                  label: 'Service',
                ),
              ]),
        ],
      ),
    );
  }
}

class FlexiGemini {
  const FlexiGemini();
}
