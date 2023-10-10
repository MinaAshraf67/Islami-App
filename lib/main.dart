import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/screens/ahadethDetails.dart';
import 'package:islami_app/screens/home.dart';
import 'package:islami_app/screens/suraDetails.dart';
import 'package:islami_app/shared/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(415, 870),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.isoCode),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
          AhadethDetailsScreen.routeName: (context) => AhadethDetailsScreen(),
        },
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
      ),
    );
  }
}
