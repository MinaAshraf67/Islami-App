import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/shared/theme.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/minusIcon.svg',
            // ignore: deprecated_member_use
            color: MyThemeData.blackColor,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(
                  'Arabic',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyThemeData.primaryColor,
                      ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  width: 18.0,
                  'assets/images/rightCheck.svg',
                  // ignore: deprecated_member_use
                  color: MyThemeData.primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(
                  'English',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
