import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halonodeviewer/CategoryWidget.dart';
import 'package:halonodeviewer/api.dart';
import 'package:halonodeviewer/category_model.dart';
import 'package:halonodeviewer/halo_list.dart';
import 'package:halonodeviewer/node_model.dart';
import 'package:halonodeviewer/node_view.dart';
import 'package:halonodeviewer/node_widget.dart';

import 'Router.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final OutlineInputBorder border = const OutlineInputBorder(
      borderSide:
          BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.zero);

  @override
  Widget build(BuildContext context) {
    const loading = const Center(
        child: SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(),
    ));

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          // print(settings);
          return RouterGenerate.generateRoute(settings);

        },
        theme: ThemeData(
          textTheme: TextTheme(),
          fontFamily: GoogleFonts.robotoMono().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: _CategoryList());
  }
}

class _CategoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __CategoryListState();
  }

}
class __CategoryListState extends State<_CategoryList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AppAPI.getAllNodes(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<CategoryModel> models = snapshot.data as List<CategoryModel>;
            return HaloList(false, models.length,
                "NODE BROWSER", true, (context, index) {
                  return CategoryWidget(models![index]);
                }, searchBuilder: (int x) {
                  return models[x].toString();
              },);
        }
          else{
            return Container();
          }
          });
  }

}
