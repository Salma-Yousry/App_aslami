//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:provider/provider.dart';
import '../../providers/app_config_provider.dart';
import '../quran/item_sura_details.dart';
import 'item_hadeth_details.dart';


class hadethDetailsScreen extends StatelessWidget {
  static const String routename = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as hadeth ;


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
            title: Text(args.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
            ),
          ),
          body:
          Container(

            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery
                  .of(context)
                  .size
                  .width * 0.08,
              vertical: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,
            ),
            decoration: BoxDecoration(
              color:
              provider.isDarkMode()?
              AppColor.PrimeryDarkColor :
              AppColor.whitecolor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(24),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Itemhadethdetails(contant:args.contant[index]);
              },
              itemCount: args.contant.length,
            ),
          ),
        ),
      ],
    );
  }
}