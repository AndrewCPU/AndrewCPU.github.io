import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halonodeviewer/object_type.dart';

class ParameterWidget extends StatelessWidget {
  ParameterType parameterType;
  bool input;
  ParameterWidget(this.input, this.parameterType);

  @override
  Widget build(BuildContext context) {
    Container circle = Container(width: 20, height: 20, margin: const EdgeInsets.only(left: 5, right: 5,top: 8, bottom: 8,), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2, style: BorderStyle.solid)),);
    List<Widget> children = [Expanded(flex: 1, child: Text(parameterType.name, maxLines: 1, style: const TextStyle(color: Colors.white), softWrap: false, overflow: TextOverflow.ellipsis, textAlign: input ? TextAlign.start : TextAlign.end,))];
    if(input) {
      children.insert(0, _ParameterTypeWidget(parameterType.type));
      children.insert(0, circle);
    }
    else{
      children.add(_ParameterTypeWidget(parameterType.type));
      children.add(circle);
    }
    return Row(children: children);
  }
}
class _ParameterTypeWidget extends StatelessWidget {
  String type;


  _ParameterTypeWidget(this.type);

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(left: 4, right: 4),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
        child: Text(type, style: TextStyle(color: Colors.white, fontSize: 14),)
      );
  }

}
