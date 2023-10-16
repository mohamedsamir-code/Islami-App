import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../model/sura_model.dart';
import '../providers/my_provider.dart';
import '../screens/suraDetails.dart';
import '../shared/constants/sura_names.dart';
import '../shared/theme.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/quran_background.png',
          ),
          Divider(
            color: provider.appMode == ThemeMode.light
                ? MyThemeData.primaryColor
                : MyThemeData.darkYellowColor,
            thickness: 2.0,
          ),
          Text(
            AppLocalizations.of(context)!.suraName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Divider(
            color: provider.appMode == ThemeMode.light
                ? MyThemeData.primaryColor
                : MyThemeData.darkYellowColor,
            thickness: 2.0,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: provider.appMode == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.darkYellowColor,
                thickness: 1.0,
                indent: 40.0,
                endIndent: 40.0,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                      arguments: SuraModel(suraName[index], index));
                },
                child: Text(
                  suraName[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              itemCount: suraName.length,
            ),
          ),
        ],
      ),
    );
  }
}
