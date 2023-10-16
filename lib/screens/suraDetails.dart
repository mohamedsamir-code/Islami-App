// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/sura_model.dart';
import '../providers/my_provider.dart';
import '../providers/sura_details_provider.dart';
import '../shared/theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuuraDetailsScreenState();
}

class _SuuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    // if (suraProvider.verses.isEmpty) {
    //   suraProvider.loadFile(args.index);
    // }
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var suraProvider = Provider.of<SuraDetailsProvider>(context);

        return SafeArea(
          child: Stack(
            children: [
              Image.asset(
                provider.getBackgrund(),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    args.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    color: provider.appMode == ThemeMode.light
                        ? MyThemeData.whiteColor
                        : MyThemeData.secondaryColor,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        18.0,
                      ),
                      side: BorderSide(
                        color: provider.appMode == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkYellowColor,
                      ),
                    ),
                    elevation: 12.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: provider.appMode == ThemeMode.light
                              ? MyThemeData.primaryColor
                              : MyThemeData.darkYellowColor,
                          thickness: 1.0,
                          indent: 30.0,
                          endIndent: 30.0,
                        ),
                        itemBuilder: (context, index) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              "${suraProvider.verses[index]} (${index + 1})",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: provider.appMode == ThemeMode.light
                                        ? MyThemeData.blackColor
                                        : MyThemeData.whiteColor,
                                  ),
                            ),
                          );
                        },
                        itemCount: suraProvider.verses.length,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
