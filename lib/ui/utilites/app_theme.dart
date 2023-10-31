import 'package:azkary/ui/utilites/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static const appbartitletextstyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.accent);

  static const suranametextstyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColor.accent);

  static const contenttextstyle = TextStyle(
      fontSize: 23, fontWeight: FontWeight.w300, color: AppColor.accent);

  static const settingtextstyle = TextStyle(
      fontSize: 26, fontWeight: FontWeight.w600, color: AppColor.accent);

  static const switchtitletextstyle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.normal, color: AppColor.accent);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.transparent,
      primaryColor: AppColor.primarycolor,
      dividerTheme:
          DividerThemeData(thickness: 3, color: AppColor.primarycolor),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColor.transparent,
          elevation: 0,
          titleTextStyle: appbartitletextstyle),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColor.accent,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)),
      textTheme: TextTheme(
        bodySmall: settingtextstyle,
        bodyMedium: switchtitletextstyle,
        displayMedium: suranametextstyle,
        displaySmall: contenttextstyle,
      ));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    primaryColor: AppColor.primarydark,
    dividerTheme: DividerThemeData(thickness: 3, color: AppColor.accentdark),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColor.transparent,
        elevation: 0,
        titleTextStyle: appbartitletextstyle.copyWith(color: AppColor.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.accentdark,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 26)),
    textTheme: TextTheme(
        bodySmall: settingtextstyle.copyWith(color: AppColor.white),
        bodyMedium: switchtitletextstyle.copyWith(color: AppColor.white),
        displayMedium: suranametextstyle.copyWith(color: AppColor.white),
        displaySmall: contenttextstyle.copyWith(color: AppColor.white)),
  );
}
