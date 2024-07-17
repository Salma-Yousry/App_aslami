import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_colors.dart';
import 'item_hadeth_name.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
List<hadeth> ahadethlist = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethlist.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children:[
        Expanded(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: AppColor.PrimeryLightColor,
          thickness: 3,
        ),
        Text('Hadeth Name',style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: AppColor.PrimeryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child:ahadethlist.isEmpty?
              Center(child: CircularProgressIndicator(
                color: AppColor.PrimeryLightColor,

              ))
              :
          ListView.separated(
            separatorBuilder: (context,index){
              return  Divider(
                color: AppColor.PrimeryLightColor,
                thickness: 2,
              );
            },
            itemBuilder: (context,index){
              return ItemhadethName(Hadeth: ahadethlist[index]);
            },
            itemCount:ahadethlist.length,

          ),
        )
      ],
    );
  }

void loadHadethFile() async {
  String hedethcontant = await  rootBundle.loadString('assets/files/ahadeth.txt');
  List<String> headethlist = hedethcontant.split('#\r\n');
  for(int i = 0 ; i<headethlist.length ; i++){
    print(headethlist[i]);
 List<String> hadethlines = headethlist[i].split('\n');
 String title = hadethlines[0];
 hadethlines.removeAt(0);
    hadeth Hadeth = hadeth(title: title , contant: hadethlines);
    ahadethlist.add(Hadeth);
    setState(() {

    });
  }
  }
}
class hadeth {
  String title;
  List <String> contant;
  hadeth({required this.contant , required this.title});
}