import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedindex =0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
 Scaffold(
  appBar: AppBar(
title: Text('Islami',
style:Theme.of(context).textTheme.bodyLarge
),
  ),
   bottomNavigationBar: Theme(
     data: Theme.of(context).copyWith(
       canvasColor: Theme.of(context).primaryColor
     ),
     child: BottomNavigationBar(
       currentIndex: selectedindex,
       onTap: (index){
         selectedindex=index;
         setState(() {

         });
       },
       items: [
         BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/quran.png'),),
             label: 'Quran'
         ),
         BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/quran_book.png'))
         ,label: 'Hadeth'
         ),
         BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/sepha.png'),),
             label: 'Sebha'
         ),
         BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/radio.png'))
             ,label: 'Radio'
         ),
       ],
     ),
   ),
   body: Taps[selectedindex],
),
      ],
    );
  }
  List <Widget> Taps=[
    QuranTab(),HadethTab(),SebhaTab(),RadioTab()
  ];
}
