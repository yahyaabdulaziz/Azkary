import 'package:azkary/ui/providers/settings_provider.dart';
import 'package:azkary/ui/screens/details_screen/details_screen.dart';
import 'package:azkary/ui/screens/home/home_screen.dart';
import 'package:azkary/ui/utilites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => SettingProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      /// change language of Azkary
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("ar"), Locale("en")],
      locale: Locale(provider.currentLocale),

      /// change mode of Azkary
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
