import 'package:flutter/material.dart';
import 'package:islami_app/screens/ahadethDetails.dart';
import 'package:islami_app/screens/home.dart';
import 'package:islami_app/screens/suraDetails.dart';
import 'package:islami_app/shared/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        AhadethDetailsScreen.routeName: (context) => AhadethDetailsScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
