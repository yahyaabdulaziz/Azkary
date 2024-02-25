import 'package:azkary/ui/model/detail_screen_arg.dart';
import 'package:azkary/ui/screens/details_screen/details_screen.dart';
import 'package:azkary/ui/utilites/app_assets.dart';
import 'package:azkary/ui/utilites/app_color.dart';
import 'package:azkary/ui/utilites/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            flex: 3, child: Image(image: AssetImage(AppAssets.mainquran))),
        const Divider(
          thickness: 3,
          color: AppColor.primarycolor,
        ),
        Text(AppLocalizations.of(context)!.suraName,
            style: Theme.of(context).textTheme.displayMedium),
        const Divider(
          thickness: 3,
          color: AppColor.primarycolor,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constant.suranames.length,
              itemBuilder: (_, index) {
                return TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: DetailsScreenArg(
                            itemName: Constant.suranames[index],
                            fileName: "${index + 1}.txt",
                            isquran: true));
                  },
                  child: Text(
                    Constant.suranames[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.normal),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
