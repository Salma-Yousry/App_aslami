import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
 //data
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  AppConfigProvider() {
    getselectedPref();
  }

  void changeLanguage(String newlanguage) async {
    if (appLanguage == newlanguage) {
      return;
    }
    appLanguage = newlanguage;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', newlanguage);

  }

  void changeTheme(ThemeMode newTheme)async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', newTheme == ThemeMode.dark);
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  void getselectedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('language')!;
    appTheme =  prefs.getBool('theme') ?? false ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

