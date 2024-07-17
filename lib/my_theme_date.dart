import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class MyThemeData{
  //light mode - dark mode - colors
 static final ThemeData lightmode = ThemeData(
  // canvasColor: AppColor.PrimeryLightColor,
   primaryColor: AppColor.PrimeryLightColor,
   scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: const AppBarTheme(
     backgroundColor: Colors.transparent,
     elevation: 0,
       centerTitle: true,

       iconTheme: IconThemeData(
        color: AppColor.backcolor,
       ),

   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     //backgroundColor: AppColor.PrimeryLightColor,
     selectedLabelStyle: TextStyle(fontSize: 20),
     selectedIconTheme: IconThemeData(size: 40,),
       unselectedIconTheme: IconThemeData(size: 35),
     selectedItemColor: AppColor.backcolor,
   ),
   textTheme: TextTheme(
     bodyLarge: TextStyle(
       color: AppColor.backcolor,
       fontWeight: FontWeight.bold,
       fontSize: 30,
     ),
     bodyMedium: TextStyle(
       color: AppColor.backcolor,
       fontWeight: FontWeight.w700,
       fontSize: 25,
     ),
     bodySmall: TextStyle(
       color: AppColor.backcolor,
       fontWeight: FontWeight.bold,
       fontSize: 22,
     ),
   ),
 );
}