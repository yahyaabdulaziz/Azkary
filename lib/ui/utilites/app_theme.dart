import 'package:azkary/ui/utilites/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static const appbartitletextstyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.accent);
  static const suranametextstyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColor.accent);

  static const contenttextstyle = TextStyle(
      fontSize: 23, fontWeight: FontWeight.w300, color: AppColor.accent);
}
