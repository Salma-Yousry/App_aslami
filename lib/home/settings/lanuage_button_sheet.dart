import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';
class Launguagebuttonsheet extends StatefulWidget {

  @override
  State<Launguagebuttonsheet> createState() => _LaunguagebuttonsheetState();
}

class _LaunguagebuttonsheetState extends State<Launguagebuttonsheet> {
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
                ///change language to english
                provider.changeLanguage('en');
              },

              child:provider.appLanguage=='en'?
              getSelectItemWidget(AppLocalizations.of(context)!.english):
              getUnSelectItemWidget(AppLocalizations.of(context)!.english)
          ),
          SizedBox(height: 15,),
          InkWell(
              onTap: (){
                ///change language to arabic
                provider.changeLanguage('ar');
              },
              child:provider.appLanguage=='ar'?
              getSelectItemWidget(AppLocalizations.of(context)!.arabic):
              getUnSelectItemWidget(AppLocalizations.of(context)!.arabic)
          ),

        ],
      ),
    );
  }

  Widget getSelectItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColor.PrimeryLightColor,
          ),),
        Icon(Icons.check,size: 25,color: AppColor.PrimeryLightColor,),
      ],
    );

  }
  Widget getUnSelectItemWidget(String text){
    return  Text(text,
        style: Theme.of(context).textTheme.bodySmall);

  }
}