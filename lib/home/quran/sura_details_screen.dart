//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'item_sura_details.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routename = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List <String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs ;

    if(verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(
      children: [
      Image.asset("assets/images/background.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    ),
    Scaffold(
    appBar: AppBar(
    title: Text(args.name,
    style:Theme.of(context).textTheme.bodyLarge
    ),
    ),
      body: verses.isEmpty?
Center(child: CircularProgressIndicator(color: AppColor.PrimeryLightColor,)

)
          :
      Container(

        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.08,
          vertical: MediaQuery.of(context).size.height*0.05,
        ),
decoration: BoxDecoration(
  color: AppColor.whitecolor.withOpacity(0.5),
  borderRadius: BorderRadius.circular(24),
),
        child: ListView.separated(
          separatorBuilder: (context,index){
            return  Divider(
              color: AppColor.PrimeryLightColor,
              thickness: 2,
            );
          },

          itemBuilder: (context,index){
          return ItemSuradetails(contant: verses[index], index: index);
        },
        itemCount: verses.length,
        ),
      ),
    ),
    ],
    );
  }

 loadFile(int index) async {
  String content = await  rootBundle.loadString('assets/files/${index+1}.txt');
  List<String> lines = content.split('\n');
  for(int i =0 ; i<lines.length;i++){
    print(lines);
  }
  verses = lines;
  setState(() {

  });
}
}
//data class
class SuraDetailsArgs{
  String name;
  int index;
  SuraDetailsArgs({required this.name,required this.index});
}
