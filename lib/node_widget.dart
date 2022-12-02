import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halonodeviewer/io_widget.dart';
import 'package:halonodeviewer/node_model.dart';
import 'package:halonodeviewer/object_type.dart';
import 'package:halonodeviewer/parameter_widget.dart';

class NodeWidget extends StatefulWidget {
  NodeModel model;

  NodeWidget(this.model);

  _NodeWidget createState() => _NodeWidget();
}

class _NodeWidget extends State<NodeWidget>{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Widget> rows = [];
    int maxSize = max(widget.model.inputs.length, widget.model.outputs.length);
    for(int i = 0; i<maxSize; i++){
      ParameterType? input = widget.model.inputs.length <= i ? null : widget.model.inputs[i];
      ParameterType? output = widget.model.outputs.length <= i ? null : widget.model.outputs[i];
      rows.add(Row(children: [
        if(input != null)
          SizedBox(width: width / 2, child: ParameterWidget(true, input)),
        if(input == null)
          Spacer(flex: 2),
        if(output == null)
          Spacer(flex: 2),
        if(output != null)
          SizedBox(width: width / 2, child: ParameterWidget(false, output))
      ],));
    }



    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Align(
        child: Column(children: [
          IOWidget(widget.model.logicModel.flowIn, widget.model.logicModel.flowOut),
          ...rows,
        ],),
      ),
    );
  }

}
