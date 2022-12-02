import 'package:flutter/cupertino.dart';
import 'package:halonodeviewer/api.dart';
import 'package:halonodeviewer/category_model.dart';
import 'package:collection/collection.dart';
import 'package:halonodeviewer/category_view.dart';
import 'package:halonodeviewer/node_model.dart';
import 'package:halonodeviewer/node_view.dart';
class PagedHaloView extends StatefulWidget {
  List<String> args;

  PagedHaloView(this.args);

  _PagedHaloView createState() => _PagedHaloView();
}
class _PagedHaloView extends State<PagedHaloView> {
  @override
  Widget build(BuildContext context) {
    Widget notFound = Container(child: Text("404 Page not Found"));
    return FutureBuilder(
      future: AppAPI.getAllNodes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.hasData) {
        List<CategoryModel> models = snapshot.data as List<CategoryModel>;
        CategoryModel? category = models.firstWhereOrNull((element) => element.name == widget.args[0]);
        if(category == null){
          print("CAT NOT FOUND");
          return notFound;
        }
        if(widget.args.length == 1) {
          return CategoryView(category);
        }
        else if(widget.args.length == 2) {
          NodeModel? node = category.children.firstWhereOrNull((element) => element.type == widget.args[1]);
          if(node == null){
            return notFound;
          }
          else{
            return NodeView(node);
          }
        }
        return notFound;
      }
      else{
        return Container(child: Text("Loading..."));
      }
    },);

    if(widget.args.length == 1) {

      }
  }

}
