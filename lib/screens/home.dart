// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';
import '../shared/theme.dart';
import '../tabs/ahadeth.dart';
import '../tabs/quran.dart';
import '../tabs/radio.dart';
import '../tabs/sebha.dart';
import '../tabs/settings.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(provider.getBackgrund(),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover),
          Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.appTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.index,
              iconSize: 40,
              onTap: (value) {
                provider.bottomNavCurrent(value);
              },
              items: [
                BottomNavigationBarItem(
                  backgroundColor: provider.appMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.secondaryColor,
                  label: AppLocalizations.of(context)!.bottomNavQuran,
                  icon: const ImageIcon(
                    AssetImage('assets/images/quran.png'),
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: provider.appMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.secondaryColor,
                  label: AppLocalizations.of(context)!.bottomNavAhadeth,
                  icon: const ImageIcon(
                    AssetImage('assets/images/ahadeth.png'),
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.bottomNavSebha,
                  backgroundColor: provider.appMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.secondaryColor,
                  icon: const ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.bottomNavRadio,
                  backgroundColor: provider.appMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.secondaryColor,
                  icon: const ImageIcon(
                    AssetImage('assets/images/radio.png'),
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.bottomNavSettings,
                  backgroundColor: provider.appMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.secondaryColor,
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
            body: tabs[provider.index],
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];
}
