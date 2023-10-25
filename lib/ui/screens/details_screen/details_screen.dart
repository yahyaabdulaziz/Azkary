import 'package:azkary/ui/model/detail_screen_arg.dart';
import 'package:azkary/ui/utilites/app_assets.dart';
import 'package:azkary/ui/utilites/app_color.dart';
import 'package:azkary/ui/utilites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "DetailsScreen";

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArg arguments;
  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArg;
    if (fileContent.isEmpty) readFile();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.mainbackground), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.transparent,
          elevation: 0,
          title: Text(
            arguments.itemName,
            style: AppTheme.appbartitletextstyle,
          ),
        ),
        body: fileContent.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    fileContent,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: AppTheme.contenttextstyle,
                  ),
                ),
              ),
      ),
    );
  }

  void readFile() async {
    String file = await rootBundle.loadString(arguments.isquran
        ? "assets/files/quran/${arguments.fileName}"
        : "assets/files/ahadeth/${arguments.fileName}");
    fileContent = file;

    /// adding numbers of ayats ...
    List<String> fileLines = file.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isquran ? "( ${i + 1} )" : " ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
