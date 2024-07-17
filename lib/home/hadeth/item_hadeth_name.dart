import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';

import 'hadeth_tab.dart';

class ItemhadethName extends StatelessWidget {
hadeth Hadeth;

ItemhadethName({required this.Hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
Navigator.of(context).pushNamed(hadethDetailsScreen.routename,
arguments:Hadeth,
);
      },
      child: Text(Hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,),
    );
  }
}
