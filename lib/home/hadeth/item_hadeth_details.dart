import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';

class Itemhadethdetails extends StatelessWidget {
String contant;
Itemhadethdetails({required this.contant});
  @override
  Widget build(BuildContext context) {
    return Text(contant,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodySmall,);
  }
}
