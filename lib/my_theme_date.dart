import 'package:flutter/material.dart';

class MyThemeData{
  //light mode - dark mode - colors
 static final ThemeData lightmode = ThemeData(
   scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: const AppBarTheme(
     backgroundColor: Colors.transparent,
     elevation: 0,
   )
 );
}