// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/shared/theme.dart';

class AhadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'ahadeth';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;

    return Stack(
      children: [
        Image.asset('assets/images/background.png',
            height: double.infinity, width: double.infinity, fit: BoxFit.cover),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                  side: BorderSide(color: MyThemeData.primaryColor)),
              elevation: 12.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.primaryColor,
                    thickness: 1.0,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        args.content[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  },
                  itemCount: args.content.length,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
