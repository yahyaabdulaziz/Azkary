import 'package:flutter/material.dart';

import '../../../../utilites/app_assets.dart';
import '../../../../utilites/app_color.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbeh_count = 0;

  String tasbeh_name = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Image(image: AssetImage(AppAssets.icsebha_head))),
          const Image(image: AssetImage(AppAssets.icsebha_body)),
          const SizedBox(height: 12),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 12),
          Center(
            child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primarycolor,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  " $tasbeh_count ",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )),
          ),
          TextButton(
            onPressed: () {
              tasbeh_count++;
              changeTasbeh();
              setState(() {});
            },
            child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primarycolor,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  " $tasbeh_name ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black),
                )),
          )
        ],
      ),
    );
  }

  changeTasbeh() {
    if (tasbeh_count == 33 && tasbeh_name == "سبحان الله") {
      tasbeh_name = "الحمد لله";
      tasbeh_count = 0;
    } else if (tasbeh_count == 33 && tasbeh_name == "الحمد لله") {
      tasbeh_name = "الله أكبر";
      tasbeh_count = 0;
    } else if (tasbeh_count == 33 && tasbeh_name == "الله أكبر") {
      tasbeh_name = "سبحان الله";
      tasbeh_count = 0;
    }
  }
}
