import 'package:azkary/ui/providers/settings_provider.dart';
import 'package:azkary/ui/utilites/app_color.dart';
import 'package:azkary/ui/utilites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool arSwitch = false;
  bool darkSwitch = false;

  late SettingProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 18),
          buildSettingsRow("العربية", arSwitch, (newValue) {
            arSwitch = newValue;
            if (arSwitch) {
              provider.setCurrentLocale("ar");
            } else {
              provider.setCurrentLocale("en");
            }
          }),
          buildSettingsRow(AppLocalizations.of(context)!.darkMode, darkSwitch,
              (newValue) {
            darkSwitch = newValue;
            if (darkSwitch) {
              provider.setCurrentMode(ThemeMode.dark);
            } else {
              provider.setCurrentMode(ThemeMode.light);
            }
          }),
        ],
      ),
    );
  }

  buildSettingsRow(String title, bool value, Function(bool) onchange) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.bodySmall),
          Spacer(),
          Switch(
            value: value,
            onChanged: onchange,
            activeColor: AppColor.primarycolor,
          ),
        ],
      ),
    );
  }
}
