import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_node_store/app_router.dart';
import 'package:flutter_node_store/providers/local_provider.dart';
import 'package:flutter_node_store/providers/theme_provider.dart';
import 'package:flutter_node_store/themes/styles.dart';
import 'package:flutter_node_store/utils/utility.dart';
import 'package:provider/provider.dart';

//----------------------------------------------------------------------------//
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
//LOGIC: อ่านข้อมูล profile จาก shared preference ---------------------//

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

  //-------------------------LOGIC : Method Logout ----------------------------//
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

// ------------------------------UI : Profile---------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      children: [       
        const SizedBox(height: 6),
        _buildHeader(),
        //const SizedBox(height: 8),
        _buildListMenu(),
        Consumer<ThemeProvider>(builder: (context, provider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                value: provider.isDark,
                onChanged: (value) {
                  // Toggle theme
                  provider.setTheme(
                    value ? AppTheme.darkTheme : AppTheme.lightTheme,
                  );
                },
              ),
              Text(provider.isDark ? 'Dark Mode' : 'Light Mode'),
            ],
          );
        })
      ],
    ));
  }

// สร้าง widget สำหรับแสดงข้อมูล profile ที่อ่านมาจาก shared preference
  Widget _buildHeader() {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return SizedBox(
            width: double.infinity,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 8),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/tananya.jpg'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_firstName $_lastName',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '$_email',
                    style: const TextStyle(
                        fontSize: 12 ),
                  ),
                  const Text(
                    'Founder&Board Director',
                    style: TextStyle(
                        fontSize: 12),
                  )
                ],
              ),
            ));
      },
    );
  }

  

//----------------------------UI: Profile Menu -------------------------------//
// สร้าง widget สำหรับแสดงรายการเมนูต่างๆ
  Widget _buildListMenu() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(AppLocalizations.of(context)!.menu_account),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.password),
          title: Text(AppLocalizations.of(context)!.menu_changepass),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(AppLocalizations.of(context)!.menu_changelang),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {
            // Create alert dialog select language
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!.menu_changelang),
                    content: SingleChildScrollView(
                      child: Consumer<LocaleProvider>(
                          builder: (context, provider, child) {
                        return ListBody(
                          children: [
                            InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('English'),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                provider.changeLocale(const Locale('en'));
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('ไทย'),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                provider.changeLocale(const Locale('th'));
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('中國人'),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                provider.changeLocale(const Locale('zh'));
                              },
                            ),
                          ],
                        );
                      }),
                    ),
                  );
                });
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(AppLocalizations.of(context)!.menu_setting),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: Text(AppLocalizations.of(context)!.menu_logout),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: _logout,
        ),
      ],
    );
  }
}
