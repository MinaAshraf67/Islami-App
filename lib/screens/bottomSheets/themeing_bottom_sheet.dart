// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/shared/theme.dart';

class ThemeingBottomSheet extends StatelessWidget {
  const ThemeingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/minusIcon.svg',
            color: MyThemeData.blackColor,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(
                  'Light',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                SvgPicture.asset(
                  width: 18.0,
                  'assets/images/rightCheck.svg',
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
                  'Dark',
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
