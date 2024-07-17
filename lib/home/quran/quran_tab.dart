import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/quran/item_sura_name.dart';

class QuranTab extends StatelessWidget {
  List <String> suraNames = [
    "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(child: Image.asset('assets/images/quran_tap.png')),
   Divider(
color: AppColor.PrimeryLightColor,
     thickness: 3,
   ),
Text('Sura Name',style: Theme.of(context).textTheme.bodyMedium,
),
        Divider(
          color: AppColor.PrimeryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
separatorBuilder: (context,index){
  return  Divider(
    color: AppColor.PrimeryLightColor,
    thickness: 2,
  );
},
            itemBuilder: (context,index){
          return ItemSuraName(name: suraNames[index],index: index,);
          },
            itemCount:suraNames.length,

          ),
        )
      ],
    );
  }
}
