import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  ///data
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
    void changelanguage (String newlanguage){
if(appLanguage == newlanguage){
  return;
}
appLanguage  = newlanguage;
notifyListeners();
}
void changeTheme (ThemeMode newTheme){
      if(appTheme == newTheme){
        return;
      }
      appTheme=newTheme;
      notifyListeners();
}
bool isDarkMode (){
      return appTheme == ThemeMode.dark;

    }
}