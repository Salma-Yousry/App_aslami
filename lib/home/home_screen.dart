import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/settings/settings_tab.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedindex =0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()?
    Image.asset("assets/images/backgronddart.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    ):
        Image.asset("assets/images/background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
 Scaffold(
  appBar: AppBar(
title: Text(AppLocalizations.of(context)!.app_title,
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
             label: AppLocalizations.of(context)!.quran
         ),
         BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/quran_book.png'))
         ,label:AppLocalizations.of(context)!.hadeth
         ),
         BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/sepha.png'),),
             label: AppLocalizations.of(context)!.sebha
         ),
         BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/radio.png'))
             ,label: AppLocalizations.of(context)!.radio
         ),
         BottomNavigationBarItem(icon: Icon(Icons.settings),
             label: AppLocalizations.of(context)!.settings
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
    QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingTab()
  ];
}
