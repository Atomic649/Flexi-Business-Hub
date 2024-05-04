import 'package:flutter/material.dart';
import 'package:flutter_node_store/screens/buttomnavpage/expense_screen.dart';
import 'package:flutter_node_store/screens/buttomnavpage/income_screen.dart';
import 'package:flutter_node_store/screens/buttomnavpage/profile_screen.dart';
import 'package:flutter_node_store/screens/buttomnavpage/statistic_screen.dart';
import 'package:flutter_node_store/screens/drawerpage/home_screen.dart';
import 'package:flutter_node_store/themes/colors.dart';

class MyBusiness extends StatefulWidget {
  @override
  State<MyBusiness> createState() => _MyBusinessState();
}

class _MyBusinessState extends State<MyBusiness> {
  //ส่วนของการสร้าง Bottom Navigation Bar
  // สร้างตัวแปรเก็บ title ของแต่ละหน้า

  // สร้างตัวแปรเก็บ index ของแต่ละหน้า
  int _currentIndex = 0;

  // สร้าง List ของแต่ละหน้า
  final List<Widget> _children = [
    const HomeScreen(),
    const StatisticScreen(),
    const IncomeScreen(),
    const ExpenseScreen(),
    const ProfileScreen()
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
          default:
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: 
      Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container( 
              width: double.infinity,        
              height: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color(0xff1100ff), const Color(0xff7300ff)],
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
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.gpp_good_outlined),
                  label: 'Statistic',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money),
                  label: 'Income',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Expense',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ]),
        ],
      ),
      
    );
  }
}
