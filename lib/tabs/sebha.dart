import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import '../providers/sebha_provider.dart';
import '../shared/theme.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => SebhaProvider(),
      builder: (context, child) {
        var sebhaProvider = Provider.of<SebhaProvider>(context);

        return Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(left: 40.0),
                  child: provider.appMode == ThemeMode.light
                      ? Image.asset(
                          'assets/images/sebha_head.png',
                          width: 70.0,
                        )
                      : Image.asset(
                          'assets/images/sebha_head_dark.png',
                          width: 70.0,
                        ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 75.0,
                      ),
                      Transform.rotate(
                        angle: sebhaProvider.angle,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            sebhaProvider.sebhaTransform();
                          },
                          child: provider.appMode == ThemeMode.light
                              ? Image.asset(
                                  'assets/images/sebha_body.png',
                                  width: 200.0,
                                )
                              : Image.asset(
                                  'assets/images/sebha_body_dark.png',
                                  width: 200.0,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 64.0,
            ),
            Text(
              AppLocalizations.of(context)!.tasbehNums,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: provider.appMode == ThemeMode.light
                    ? const Color(0xFFB7935F).withOpacity(0.4)
                    : MyThemeData.secondaryColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Text(
                sebhaProvider.counter.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: provider.appMode == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.darkYellowColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Text(
                sebhaProvider.tasbehat[sebhaProvider.index],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: provider.appMode == ThemeMode.light
                          ? MyThemeData.whiteColor
                          : MyThemeData.blackColor,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
