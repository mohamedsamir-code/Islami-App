import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import '../shared/theme.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.0,
          ),
          Text(
            AppLocalizations.of(context)!.settingsLanguage,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              provider.showLanguageBottomSheet(context);
            },
            child: Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: provider.appMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.darkYellowColor,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.settingsLanguageEn
                        : AppLocalizations.of(context)!.settingsLanguageAr,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: provider.appMode == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : MyThemeData.whiteColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            AppLocalizations.of(context)!.settingsThemeing,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              provider.showThemeingBottomSheet(context);
            },
            child: Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: provider.appMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.darkYellowColor,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    provider.appMode == ThemeMode.light
                        ? AppLocalizations.of(context)!.settingsThemeingLight
                        : AppLocalizations.of(context)!.settingsThemeingDark,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: provider.appMode == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : MyThemeData.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
