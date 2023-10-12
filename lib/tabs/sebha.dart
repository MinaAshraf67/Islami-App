import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/shared/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

int counter = 0;
double angle = 10;
List<String> tasbehat = ['سبحان الله', 'الحمدلله', 'الله اكبر'];
int index = 0;

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20.0.h,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 40.0),
                child: provider.appMode == ThemeMode.light
                    ? Image.asset(
                        'assets/images/sebha_head.png',
                        width: 70.0.w,
                      )
                    : Image.asset(
                        'assets/images/sebha_head_dark.png',
                        width: 70.0.w,
                      ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 75.0.h,
                    ),
                    Transform.rotate(
                      angle: angle,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            counter++;
                            angle += 15;
                            if (counter == 30) {
                              if (index == 2) {
                                index = 0;
                              }
                              index++;
                              counter = 0;
                            }
                          });
                        },
                        child: provider.appMode == ThemeMode.light
                            ? Image.asset(
                                'assets/images/sebha_body.png',
                                width: 200.0.w,
                              )
                            : Image.asset(
                                'assets/images/sebha_body_dark.png',
                                width: 200.0.w,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 64.0.h,
          ),
          Text(
            AppLocalizations.of(context)!.tasbehNums,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: 32.0.h,
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
              counter.toString(),
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
              tasbehat[index],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: provider.appMode == ThemeMode.light
                        ? MyThemeData.whiteColor
                        : MyThemeData.blackColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
