import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/screens/ahadethDetails.dart';
import 'package:islami_app/shared/theme.dart';

// ignore: must_be_immutable
class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadeth();
    }

    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/hadeth_background.png',
          ),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2.0,
          ),
          Text(
            'Ahadeth',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 2.0,
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverList.separated(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AhadethDetailsScreen.routeName,
                          arguments: allAhadeth[index],
                        );
                      },
                      child: Text(
                        allAhadeth[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.primaryColor,
                    thickness: 1.0,
                    indent: 40.0,
                    endIndent: 40.0,
                  ),
                  itemCount: allAhadeth.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadHadeth() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split('\n');
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title: title, content: content);
        allAhadeth.add(hadethModel);
        setState(() {});
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
