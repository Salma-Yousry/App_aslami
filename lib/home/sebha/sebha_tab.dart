import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:provider/provider.dart';
import '../../providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin {
  int counter = 0;
  int tasbeehIndex = 0;
  AnimationController? _animationController;

  List<String> tasbeehList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {

        tasbeehList = [
          AppLocalizations.of(context)!.subhanallah,
          AppLocalizations.of(context)!.alhamdulillah,
          AppLocalizations.of(context)!.allahuakbar,
          AppLocalizations.of(context)!.laillahaillallah,
          AppLocalizations.of(context)!.astaghfirullah,
        ];
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      if (counter < 33) {
        counter++;
      } else {
        counter = 1;
        _changeTasbeeh();
      }

      _animationController?.forward(from: 0.0,);
    });
  }

  void _changeTasbeeh() {
    setState(() {
      tasbeehIndex = (tasbeehIndex + 1) % tasbeehList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    final rotationAnimation = Tween(begin: 0.0, end: 1/100* 3.14159).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          provider.isDarkMode()
              ? Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/head of seb7a dark.png",
              fit: BoxFit.cover,
            ),
          )
              : Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/head of seb7a.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 37,
            child: RotationTransition(
              turns: rotationAnimation,
              child: provider.isDarkMode()
                  ? Image.asset(
                "assets/images/bodysephadart.png",
                fit: BoxFit.cover,
              )
                  : Image.asset(
                "assets/images/body of seb7a.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    AppLocalizations.of(context)!.add_tasbeeh,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: provider.isDarkMode()
                          ? AppColor.whitecolor
                          : AppColor.backcolor,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      style: ElevatedButton.styleFrom(
                        primary: provider.isDarkMode()
                            ? AppColor.PrimeryDarkColor
                            : AppColor.PrimeryLightColor,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        "$counter",
                        style: TextStyle(
                          fontSize: 20,
                          color: provider.isDarkMode()
                              ? AppColor.whitecolor
                              : AppColor.backcolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: provider.isDarkMode()
                            ? AppColor.yellowcolor
                            : AppColor.PrimeryLightColor,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40), // Circular border radius
                        ),
                      ),
                      child: Text(
                        tasbeehList.isEmpty ? "" : tasbeehList[tasbeehIndex],
                        style: TextStyle(
                          fontSize: 20,
                          color:provider.isDarkMode()
                              ? AppColor.backcolor
                              : AppColor.whitecolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}