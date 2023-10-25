import 'package:azkary/ui/screens/details_screen/details_screen.dart';
import 'package:azkary/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      HomeScreen.routeName: (_) => HomeScreen(),
      DetailsScreen.routeName: (_) => DetailsScreen(),
    },
    initialRoute: HomeScreen.routeName,
  ));
}
