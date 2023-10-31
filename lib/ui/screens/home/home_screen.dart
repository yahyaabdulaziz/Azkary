import 'package:azkary/ui/providers/settings_provider.dart';
import 'package:azkary/ui/screens/home/tabs/ahadethtab/ahadeth_tab.dart';
import 'package:azkary/ui/screens/home/tabs/qurantab/quran_tab.dart';
import 'package:azkary/ui/screens/home/tabs/radiotab/radio_tab.dart';
import 'package:azkary/ui/screens/home/tabs/sebhatab/sebha_tab.dart';
import 'package:azkary/ui/screens/home/tabs/settingstab/settings_tab.dart';
import 'package:azkary/ui/utilites/app_assets.dart';
import 'package:azkary/ui/utilites/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttabindex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.isDarkMode()
                  ? AppAssets.mainbackground
                  : AppAssets.backgrounddark),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.azkary,
          ),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[currenttabindex],
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
            currentIndex: currenttabindex,
            onTap: (index) {
              currenttabindex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(
                    AppAssets.icquran,
                  )),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(
                    AppAssets.icahadeth,
                  )),
                  label: AppLocalizations.of(context)!.ahadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(
                    AppAssets.icsebha,
                  )),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(
                    AppAssets.icradio,
                  )),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings),
            ]),
      );
}
