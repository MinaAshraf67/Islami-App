import 'package:flutter/material.dart';
import 'package:islami_app/shared/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 40.0),
                child: Image.asset(
                  'assets/images/sebha_head.png',
                  width: 70.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 75.0,
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
                        child: Image.asset(
                          'assets/images/sebha_body.png',
                          width: 200.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 64.0,
          ),
          Text(
            AppLocalizations.of(context)!.tasbehNums,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFB7935F).withOpacity(0.4),
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
              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              tasbehat[index],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: MyThemeData.whiteColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
