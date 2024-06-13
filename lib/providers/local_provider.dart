
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';


class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  // Constructor
  LocaleProvider(Locale locale) {
    _locale = locale;
  }

  // Change Locale
  void changeLocale(Locale newLocale) async {
    // Save new locale to shared preference
    await Utility.setSharedPreference('languageCode', newLocale.languageCode);

    _locale = newLocale;
    notifyListeners();
  }
}
