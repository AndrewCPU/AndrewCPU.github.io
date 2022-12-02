import 'package:flutter/material.dart';
import 'package:halonodeviewer/api.dart';
import 'package:halonodeviewer/page_view.dart';

import 'CategoryWidget.dart';
import 'category_model.dart';
import 'node_model.dart';
import 'node_view.dart';

class RouterGenerate {
  static MaterialPageRoute generateRoute(
      RouteSettings settings) {
        List<String> args = settings.name!.split("/").sublist(1);
    return MaterialPageRoute(builder: (context) {
      return PagedHaloView(args);
    }, settings: settings);
  }
}
