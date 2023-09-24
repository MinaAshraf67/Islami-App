import 'package:flutter/material.dart';
import 'package:islami_app/shared/theme.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/tabs/quran.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sebha.dart';
import 'package:islami_app/tabs/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/background.png',
            height: double.infinity, width: double.infinity, fit: BoxFit.cover),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
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
                backgroundColor: MyThemeData.primaryColor,
                label: "Quran",
                icon: const ImageIcon(
                  AssetImage('assets/images/quran.png'),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: MyThemeData.primaryColor,
                label: "Ahadeth",
                icon: const ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: "Sebha",
                backgroundColor: MyThemeData.primaryColor,
                icon: const ImageIcon(
                  AssetImage('assets/images/sebha.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: "Radio",
                backgroundColor: MyThemeData.primaryColor,
                icon: const ImageIcon(
                  AssetImage('assets/images/radio.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                backgroundColor: MyThemeData.primaryColor,
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: tabs[index],
        ),
      ],
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
