import 'package:flutter/material.dart';

import '../../../../model/detail_screen_arg.dart';
import '../../../../utilites/app_assets.dart';
import '../../../../utilites/app_color.dart';
import '../../../../utilites/app_theme.dart';
import '../../../../utilites/constant.dart';
import '../../../details_screen/details_screen.dart';

class AhadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
            flex: 3, child: Image(image: AssetImage(AppAssets.mainahadeth))),
        const Divider(
          thickness: 3,
          color: AppColor.primarycolor,
        ),
        const Text(
          "Hadeth Names",
          style: AppTheme.suranametextstyle,
        ),
        const Divider(
          thickness: 3,
          color: AppColor.primarycolor,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constant.ahadethnames.length,
              itemBuilder: (_, index) {
                return TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: DetailsScreenArg(
                            itemName: Constant.ahadethnames[index],
                            fileName: "h${index + 1}.txt",
                            isquran: false));
                  },
                  child: Text(
                    Constant.ahadethnames[index],
                    textAlign: TextAlign.center,
                    style: AppTheme.suranametextstyle
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
