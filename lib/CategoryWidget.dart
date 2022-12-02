import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halonodeviewer/OnHover.dart';
import 'package:halonodeviewer/category_model.dart';
import 'package:halonodeviewer/category_view.dart';

class CategoryWidget extends StatefulWidget {
  CategoryModel model;

  CategoryWidget(this.model);

  _CategoryWidget createState() => _CategoryWidget();
}

class _CategoryWidget extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/${widget.model.name}");
      },
      child: OnHover(
        builder: (bool isHovered) {
          return AnimatedContainer(
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.all(15),
              decoration:
                  BoxDecoration(color: isHovered ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Text(widget.model.name, style: (Text("").style ?? (TextStyle())).copyWith(color: isHovered ? Colors.white : Colors.black, fontSize: 20),),
                  Spacer(),
                  Icon(Icons.navigate_next_sharp, color: isHovered ? Colors.white : Colors.black,),
                ],
              ));
        },
      ),
    );
  }
}
