import 'package:azkary/ui/screens/home/tabs/ahadethtab/ahadeth_tab.dart';
import 'package:azkary/ui/screens/home/tabs/qurantab/quran_tab.dart';
import 'package:azkary/ui/screens/home/tabs/radiotab/radio_tab.dart';
import 'package:azkary/ui/screens/home/tabs/sebhatab/sebha_tab.dart';
import 'package:azkary/ui/utilites/app_assets.dart';
import 'package:azkary/ui/utilites/app_color.dart';
import 'package:azkary/ui/utilites/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttabindex = 0;
  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    AhadethTab(),
    QuranTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.mainbackground), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.transparent,
          elevation: 0,
          title: Text(
            "Islami",
            style: AppTheme.appbartitletextstyle,
          ),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[currenttabindex],
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: AppColor.primarycolor),
        child: BottomNavigationBar(
            currentIndex: currenttabindex,
            onTap: (index) {
              currenttabindex = index;
              setState(() {});
            },
            selectedItemColor: AppColor.accent,
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    AppAssets.icradio,
                  )),
                  label: "radio"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    AppAssets.icsebha,
                  )),
                  label: "sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    AppAssets.icahadeth,
                  )),
                  label: "ahadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    AppAssets.icquran,
                  )),
                  label: "quran"),
            ]),
      );
}
