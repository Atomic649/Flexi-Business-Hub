
import 'package:flexi_business_hub/app_router.dart';
import 'package:flexi_business_hub/providers/local_provider.dart';
import 'package:flexi_business_hub/providers/theme_provider.dart';
import 'package:flexi_business_hub/themes/styles.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//-------------------------------VAR กำหนดตัวแปร -------------------------------//

var initialRoute; // กำหนดตัวแปร initialRoute ให้กับ MaterialApp

var locale; // กำหนดตัวแปร locale ให้กับ Provider

ThemeData? themeData;
var isDark; // กำหนดตัวแปร themeData, isDark ให้กับ Provider

//-----------------------------------------------------------------------------//

void main() async {
  // ต้องเรียกใช้ WidgetsFlutterBinding.ensureInitialized()
  // เพื่อให้สามารถเรียกใช้ SharedPreferences ได้
  WidgetsFlutterBinding.ensureInitialized();

  // เรียกใช้ SharedPreferences
  await Utility.initSharedPrefs();

//-------------------------Set Defualt Welcome Screen-------------------------//
  // ถ้าเคย Login แล้ว ให้ไปยังหน้า Dashboard
  if (Utility.getSharedPreference('loginStatus') == true) {
    initialRoute = AppRouter.dashboard;
  } else if (Utility.getSharedPreference('welcomeStatus') == true) {
    // ถ้าเคยแสดง Intro แล้ว ให้ไปยังหน้า Login
    initialRoute = AppRouter.login;
  } else {
    // ถ้ายังไม่เคยแสดง Intro ให้ไปยังหน้า Welcome
    initialRoute = AppRouter.welcome;
  }
//------------------------Set Defualt Laguage & Theme------------------------//

// Set default locale from sharedpreference
  String? languageCode = await Utility.getSharedPreference('languageCode');
  locale = Locale(languageCode ?? 'en');

// Set default theme from sharepreference
  isDark = await Utility.getSharedPreference('isDark') ?? false;
  themeData =
      isDark && isDark != null ? AppTheme.darkTheme : AppTheme.lightTheme;

//----------------------------------------------------------------------------//
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(locale),
        ),
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(themeData!, isDark!))
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, locale, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme.getTheme(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale.locale,
            initialRoute: initialRoute,
            routes: AppRouter.routes,
          );
        },
      ),
    );
  }
}
