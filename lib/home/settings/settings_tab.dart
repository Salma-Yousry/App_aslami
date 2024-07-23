import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/settings/theme_button_sheet.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'lanuage_button_sheet.dart';

class SettingTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {

              showLanguageButtonSheet(context);
            },
            child: Container(

              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:
                provider.isDarkMode()?
                AppColor.PrimeryDarkColor :
                AppColor.PrimeryLightColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down, size: 35,
                 color: provider.isDarkMode()?
                 AppColor.yellowcolor :
                 AppColor.whitecolor,
                 ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showThemeButtonSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:  provider.isDarkMode()?
                AppColor.PrimeryDarkColor :
                AppColor.PrimeryLightColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down, size: 35, color: provider.isDarkMode()?
                  AppColor.yellowcolor :
                  AppColor.whitecolor,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Launguagebuttonsheet(),
    );
  }

  void showThemeButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Themebuttonsheet(),
    );
  }
}
