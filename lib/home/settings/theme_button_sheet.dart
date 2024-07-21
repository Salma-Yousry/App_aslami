import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:provider/provider.dart';
import '../../providers/app_config_provider.dart';


class Themebuttonsheet extends StatefulWidget {

  @override
  State<Themebuttonsheet> createState() => _ThemebuttonsheetState();
}

class _ThemebuttonsheetState extends State<Themebuttonsheet> {
  @override
  Widget build(BuildContext context) {
    var provider  = Provider.of<AppConfigProvider>(context);

    return Container(

      margin: EdgeInsets.all(15),
     child:Column(

       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         InkWell(
           onTap: (){
            ///change language to dark
             provider.changeTheme(ThemeMode.dark);
           },
           // child:provider.appTheme == ThemeMode.dark?
             child:provider.isDarkMode()?
               getSelectItemWidget(AppLocalizations.of(context)!.dark):
               getUnSelectItemWidget(AppLocalizations.of(context)!.dark)
         ),
         SizedBox(height: 15,),
         InkWell(
           onTap: (){
      ///change language to light
      provider.changeTheme(ThemeMode.light);
           },
        //   child:provider.appTheme == ThemeMode.light?
             child:provider.isDarkMode()?
           getUnSelectItemWidget(AppLocalizations.of(context)!.light):
           getSelectItemWidget(AppLocalizations.of(context)!.light)
         ),

       ],
     ),
    );
  }

  Widget getSelectItemWidget(String text){
    var provider  = Provider.of<AppConfigProvider>(context);
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: provider.isDarkMode()?
          AppColor.yellowcolor :
          AppColor.PrimeryLightColor,
      ),),
    Icon(Icons.check,size: 25
        ,
   color:provider.isDarkMode()?
   AppColor.yellowcolor :
        AppColor.PrimeryLightColor
    ),
  ],
);

  }
  Widget getUnSelectItemWidget(String text){
    return  Text(text,
        style: Theme.of(context).textTheme.bodySmall);

  }
}
