import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/constants.dart';

class LanguageChangeController with ChangeNotifier {
  LanguageChangeController() {
    Future.delayed(Duration.zero, getLocaleFromSettings);
  }

  Locale? _appLocale;
  Locale? get appLocale => _appLocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocale = type;
    if (type == const Locale("en")) {
      await sp.setString("languageCode", "en");
    } else if (type == const Locale("ar")) {
      await sp.setString("languageCode", "ar");
    }
    setGlobalAppLocale(_appLocale!);
    print(_appLocale!.toLanguageTag());
    notifyListeners();
  }

  void getLocaleFromSettings() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? languageCode = sp.getString("languageCode");
    if (languageCode == null) {
      _appLocale = const Locale("en");
    } else {
      _appLocale = Locale(languageCode);
    }
    notifyListeners();
  }
}
