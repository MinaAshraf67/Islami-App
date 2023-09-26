import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/screens/suraDetails.dart';
import 'package:islami_app/shared/constants/sura_names.dart';
import 'package:islami_app/shared/theme.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/quran_background.png',
          ),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2.0,
          ),
          Text(
            'Sura Name',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2.0,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: MyThemeData.primaryColor,
                thickness: 1.0,
                indent: 40.0,
                endIndent: 40.0,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                      arguments: SuraModel(suraName[index], index));
                },
                child: Text(
                  suraName[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              itemCount: suraName.length,
            ),
          ),
        ],
      ),
    );
  }
}
