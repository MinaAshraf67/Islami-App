import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/screens/bottomSheets/language_bottom_sheet.dart';
import 'package:islami_app/screens/bottomSheets/themeing_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/shared/theme.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.0.h,
          ),
          Text(
            AppLocalizations.of(context)!.settingsLanguage,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              setState(() {
                showLanguageBottomSheet();
              });
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
                    provider.isoCode == 'en'
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
            height: 16.0.h,
          ),
          Text(
            AppLocalizations.of(context)!.settingsThemeing,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              setState(() {
                showThemeingBottomSheet();
              });
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

  showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      builder: (context) => LanguageBottomSheet(),
    );
  }

  showThemeingBottomSheet() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      builder: (context) => ThemeingBottomSheet(),
    );
  }
}
