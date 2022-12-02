import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOWidget extends StatelessWidget {
  bool accepts;
  bool produces;

  IOWidget(this.accepts, this.produces);

  Widget getDiamond() {
    double size = 25;
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(
          pi / 4,
        ),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
          ),
          child: InkWell(
            splashColor: Colors.blueAccent,
            onTap: () {},
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(
                  -pi / 4,
                ),
                child: Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        if(accepts)
          getDiamond(),
        if(accepts)
          Spacer(),
        if(!accepts)
          Spacer(flex:  2,),
        if(produces)
          Spacer(),
        if(produces)
          getDiamond(),
        if(!produces)
          Spacer(flex: 2)
      ],),
    );
  }

}
