import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../providers/app_config_provider.dart';
class RadioTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/icon_radio.png'),
        SizedBox(height: 50,),
        Text(AppLocalizations.of(context)!.radio_quran,style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 60,),
        provider.isDarkMode()?
        Image.asset("assets/images/play_dart.png",
          fit: BoxFit.fill,
        ):
        Image.asset('assets/images/play.png',
          fit: BoxFit.fill,
        ),

      ],
    ),
    );
  }
}
