import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/hadeth_details_provider.dart';
import '../providers/my_provider.dart';
import '../screens/ahadethDetails.dart';
import '../shared/theme.dart';

// ignore: must_be_immutable
class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    // if (allAhadeth.isEmpty) {
    //   loadHadeth();
    // }

    return ChangeNotifierProvider(
      create: (context) => HadethDetailsProvider()..loadHadeth(),
      builder: (context, child) {
        var hadethProvider = Provider.of<HadethDetailsProvider>(context);
        return Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/hadeth_background.png',
              ),
              Divider(
                color: provider.appMode == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.darkYellowColor,
                thickness: 2.0,
              ),
              Text(
                AppLocalizations.of(context)!.ahadeth,
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
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverList.separated(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AhadethDetailsScreen.routeName,
                              arguments: hadethProvider.allAhadeth[index],
                            );
                          },
                          child: Text(
                            hadethProvider.allAhadeth[index].title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        color: provider.appMode == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkYellowColor,
                        thickness: 1.0,
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                      itemCount: hadethProvider.allAhadeth.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
