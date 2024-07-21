
import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:islami_app/my_theme_date.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:(context) => AppConfigProvider() ,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var provider  = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routename: (context) => SuraDetailsScreen(),
        hadethDetailsScreen.routename: (context) =>  hadethDetailsScreen(),
      },
      theme: MyThemeData.lightmode,
      darkTheme: MyThemeData.darkmode,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}