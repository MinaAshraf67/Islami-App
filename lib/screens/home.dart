import 'package:flutter/material.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/shared/theme.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/tabs/quran.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sebha.dart';
import 'package:islami_app/tabs/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

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
              currentIndex: index,
              iconSize: 40,
              onTap: (value) {
                setState(() {
                  index = value;
                });
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
            body: tabs[index],
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
