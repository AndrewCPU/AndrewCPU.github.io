import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halonodeviewer/halo_list.dart';
import 'package:halonodeviewer/node_widget.dart';

import 'node_model.dart';

class NodeView extends StatefulWidget {
  NodeModel model;
  NodeView(this.model);
  _NodeView createState() =>  _NodeView();
}
class _NodeView extends State<NodeView> {
  @override
  Widget build(BuildContext context) {
    return HaloList(true, 1, "${widget.model.name}", false, (context, i) {
      return NodeWidget(widget.model);
    }, footer: widget.model.description, titleBackground: widget.model.category.color, scaffoldBackground: Colors.black, searchBuilder: (int x) {
      return widget.model.toString();
    }, subdir: widget.model.category.name);
  }

}
