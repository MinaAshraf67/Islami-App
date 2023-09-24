import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islami_app/shared/theme.dart';

class SuuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetails';

  @override
  State<SuuraDetailsScreen> createState() => _SuuraDetailsScreenState();
}

class _SuuraDetailsScreenState extends State<SuuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(
      children: [
        Image.asset('assets/images/background.png',
            height: double.infinity, width: double.infinity, fit: BoxFit.cover),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
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
                    return Text(
                      verses[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = file.split('\n');
    setState(() {
      verses = lines;
    });
  }
}
