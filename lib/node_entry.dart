import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halonodeviewer/node_model.dart';
import 'package:halonodeviewer/node_view.dart';

import 'OnHover.dart';

class NodeEntry extends StatefulWidget {
  NodeModel model;

  NodeEntry(this.model);

  _NodeEntry createState() => _NodeEntry();
}
class _NodeEntry extends State<NodeEntry> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/${widget.model.category.name}/${widget.model.type}");
      },
      child: OnHover(
        builder: (bool isHovered) {
          return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.all(15),
              decoration:
              BoxDecoration(color: isHovered ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Text(widget.model.name, style: (Text("").style ?? (TextStyle())).copyWith(color: isHovered ? Colors.white : Colors.black, fontSize: 20),),
                  const Spacer(),
                  Icon(Icons.navigate_next_sharp, color: isHovered ? Colors.white : Colors.black,),
                ],
              ));
        },
      ),
    );
  }

}
