import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';

class ItemSuraName extends StatelessWidget {
String name;
int index;
ItemSuraName({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
Navigator.of(context).pushNamed(SuraDetailsScreen.routename,
arguments:SuraDetailsArgs(name: name ,index: index,),
);
      },
      child: Text(name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,),
    );
  }
}
