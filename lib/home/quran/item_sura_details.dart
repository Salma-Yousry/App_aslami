import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';

class ItemSuradetails extends StatelessWidget {
String contant;
int index;
ItemSuradetails({required this.contant,required this.index});
  @override
  Widget build(BuildContext context) {
    return Text('$contant (${index+1})',
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodySmall,);
  }
}
