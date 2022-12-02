import 'package:flutter/cupertino.dart';
import 'package:halonodeviewer/category_model.dart';
import 'package:halonodeviewer/halo_list.dart';
import 'package:halonodeviewer/node_entry.dart';

class CategoryView extends StatefulWidget {
  CategoryModel model;

  CategoryView(this.model);

  _CategoryView createState() => _CategoryView();
}

class _CategoryView extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return HaloList(true, widget.model.children.length, widget.model.name, true,
        (context, i) {
      return NodeEntry(widget.model.children[i]);
    }, footer: widget.model.description, titleBackground: widget.model.color, searchBuilder: (int x) {
        return widget.model.toString();
      },);
  }
}
