import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/radio_background.png',
          ),
          const SizedBox(
            height: 64.0,
          ),
          Text(
            AppLocalizations.of(context)!.quranRadio,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          provider.appMode == ThemeMode.light
              ? Image.asset(
                  'assets/images/media_icons.png',
                )
              : Image.asset(
                  'assets/images/media_icons_dark.png',
                ),
        ],
      ),
    );
  }
}
