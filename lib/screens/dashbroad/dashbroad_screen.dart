import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/providers/theme_provider.dart';
import 'package:flutter_node_store/screens/main_dashbroad/connection.dart';
import 'package:flutter_node_store/screens/main_dashbroad/my_business.dart';
import 'package:flutter_node_store/themes/colors.dart';
import 'package:flutter_node_store/utils/utility.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Switch default value
  bool _switchfacebook = false;
  bool _switchtiktok = false;
  bool _switchyoutube = false;
  bool _switchshopee = false;
  bool _switchline = false;

  //ส่วนของการสร้าง Bottom Navigation Bar
  // สร้างตัวแปรเก็บ title ของแต่ละหน้า
  String _title = ' Flexi Business Hub';

  // สร้างตัวแปรเก็บ index ของแต่ละหน้า
  int _currentIndex = 0;

  // สร้าง List ของแต่ละหน้า
  final List<Widget> _children = [
    MyBusiness(),
    Connection(),
  ];

  //------- ฟังก์ขันในการเปลี่ยนหน้า โดยรับค่า index จากการกดที่ bottomNavigationBar------//

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'My Business';
          break;
        case 1:
          _title = 'Atomic Intergroup'; //Todo Logic Business Name
          break;
        default:
          _title = 'My Business';
      }
    });
  }

  // -------------------------Logout function---------------------------------//

  _logout() {
    // Remove token, loginStatus shared preference
    Utility.removeSharedPreference('token');
    Utility.removeSharedPreference('loginStatus');

    // Clear all route and push to login screen
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouter.login,
      (route) => false,
    );
  }

  // -------------------อ่านข้อมูล profile จาก shared preference -----------------//

  String? _firstName, _lastName, _email;

  // สร้างฟังก์ชัน getUserProfile สำหรับอ่านข้อมูลจาก shared preference
  getUserProfile() async {
    var firstName = await Utility.getSharedPreference('firstName');
    var lastName = await Utility.getSharedPreference('lastName');
    var email = await Utility.getSharedPreference('email');

    setState(() {
      _firstName = firstName;
      _lastName = lastName;
      _email = email;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  // ------------------------Dashbroad Screen Layout--------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: Drawer(
        width: 260,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        child: Stack(children: [
          Column(
            children: [
              ListView(
                padding: const EdgeInsets.only(right: 0.0, left: 10.0),
                shrinkWrap: true,
                children: [
                  Consumer<ThemeProvider>(
                    builder: (context, provider, child) {
                      return UserAccountsDrawerHeader(
                        margin: const EdgeInsets.only(bottom: 0.0),
                        accountName: Text('$_firstName $_lastName'),
                        accountEmail: Text('$_email'),
                        decoration: BoxDecoration(
                          color: provider.isDark ? primaryText : primary,
                        ),
                        currentAccountPicture: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/tananya.jpg'),
                        ),
                        otherAccountsPictures: const [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/noavartar.png'),
                          ),
                        ],
                      );
                    },
                  ),

                  //-----------------------------------------------
                  ListTile(
                    leading: const Icon(
                      Icons.business_center_outlined,
                      size: 20,
                      color: icons,
                    ),
                    title: const Text('ประเภทธุรกิจ',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: icons,
                        )),
                    subtitle: const Text('นิติบุคคล',
                        style: TextStyle(
                          color: Color(0xFF53506A),
                        )),
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.about);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.attach_money_outlined,
                      size: 20,
                      color: icons,
                    ),
                    title: const Text('ภาษีมูลค่าเพิ่ม VAT',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: icons,
                        )),
                    subtitle: const Text(
                      'ภาษีมูลค่าเพิ่ม',
                      style: TextStyle(
                        color: Color(0xFF53506A),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.contact);
                    },
                  ),

                  ListTile(
                    leading: const Icon(
                      Icons.inventory_sharp,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Product',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: icons,
                        )),
                    subtitle: const Text(
                      'ตัดสต็อกอัตโนมัติ',
                      style: TextStyle(
                        color: Color(0xFF53506A),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.lock,
                      color: icons,
                      size: 12,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.productScreen);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.table_chart_outlined,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Ads Cost',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: icons,
                        )),
                    subtitle: const Text(
                      'ดึงโฆษณาอัตโนมัติ',
                      style: TextStyle(
                        color: Color(0xFF53506A),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.lock,
                      color: icons,
                      size: 12,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.productScreen);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.auto_graph_sharp,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Sales Collector',
                        style: TextStyle(
                          color: icons,
                          fontSize: 15.0,
                        )),
                    subtitle: const Text(
                      'ดึงยอดขายอัตโนมัติ',
                      style: TextStyle(
                        color: Color(0xFF53506A),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.lock,
                      color: icons,
                      size: 12,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.productScreen);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      'Platform Your Business Focus ',
                      style: TextStyle(
                        color: icons,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  //-----------------------------------------------------
                  ListTile(
                    leading: const Icon(
                      Icons.facebook,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Facebook',
                        style: TextStyle(
                          color: icons,
                        )),
                    onTap: () {},
                    trailing: Switch(
                      value: _switchfacebook,
                      onChanged: (bool value) {
                        setState(() {
                          _switchfacebook = value;
                        });
                      },
                      activeColor: const Color(0xFF01E9B3),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Color(0xFF918697),
                      inactiveTrackColor: Colors.white,
                      splashRadius: 20.0,

                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.tiktok,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Tiktok',
                        style: TextStyle(
                          color: icons,
                        )),
                    onTap: () {},
                    trailing: Switch(
                      value: _switchtiktok,
                      onChanged: (bool value) {
                        setState(() {
                          _switchtiktok = value;
                        });
                      },
                      activeColor: const Color(0xFF01E9B3),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Color(0xFF918697),
                      inactiveTrackColor: Colors.white,
                      splashRadius: 20.0,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.live_tv_outlined,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Youtube',
                        style: TextStyle(
                          color: icons,
                        )),
                    onTap: () {},
                    trailing: Switch(
                      value: _switchyoutube,
                      onChanged: (bool value) {
                        setState(() {
                          _switchyoutube = value;
                        });
                      },
                      activeColor: const Color(0xFF01E9B3),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Color(0xFF918697),
                      inactiveTrackColor: Colors.white,
                      splashRadius: 20.0,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.storefront_rounded,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Shopee',
                        style: TextStyle(
                          color: icons,
                        )),
                    onTap: () {},
                    trailing: Switch(
                      value: _switchshopee,
                      onChanged: (bool value) {
                        setState(() {
                          _switchshopee = value;
                        });
                      },
                      activeColor: const Color(0xFF01E9B3),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Color(0xFF918697),
                      inactiveTrackColor: Colors.white,
                      splashRadius: 20.0,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.local_police_sharp,
                      color: icons,
                      size: 20,
                    ),
                    title: const Text('Line',
                        style: TextStyle(
                          color: icons,
                        )),
                    onTap: () {},
                    trailing: Switch(
                      value: _switchline,
                      onChanged: (bool value) {
                        setState(() {
                          _switchline = value;
                        });
                      },
                      activeColor: const Color(0xFF01E9B3),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Color(0xFF918697),
                      inactiveTrackColor: Colors.white,
                      splashRadius: 20.0,
                    ),
                  ),
                ],
              ),
              Expanded(                
                child: ListTile(
                  focusColor: const Color(0xFF01E9B3),
                  trailing: const Icon(
                    Icons.exit_to_app_outlined,
                    size: 18,
                  ),
                  title: Text(AppLocalizations.of(context)!.menu_logout,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: icons,
                      )),
                  onTap: _logout,
                ),
              ),
            ],
          ),
        ]),
      ),
      // endDrawer: Drawer(),
      body: _children[_currentIndex],

      bottomNavigationBar: Stack(children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 90,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/menu_s.png"),
                fit: BoxFit.fitHeight,
              ),
              gradient: LinearGradient(
                colors: [Color(0xff29ffbf), Color(0xff00ffff)],
                stops: [0.35, 0.85],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),

        // My Business <---> Connection
        BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: const Color(0xFF004CFF),
            onTap: (value) {
              onTabTapped(value);
            },
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.grey.shade200,
                tooltip: 'Home',
                activeIcon: const Icon(Icons.home),
                icon: const Icon(Icons.favorite),
                label: 'My Business',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.tealAccent,
                icon: Icon(Icons.connect_without_contact),
                label: 'Connection',
              ),
            ]),
      ]),
    );
  }
}
