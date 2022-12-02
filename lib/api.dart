import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:halonodeviewer/appconstants.dart';
import 'package:halonodeviewer/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
class AppAPI {
  static dynamic _allNodeData;
  static Future<dynamic> getAllNodeData() async {
    if(_allNodeData != null) {
      return _allNodeData;
    }
    var result = await rootBundle.loadString("assets/allnodes.json");
    _allNodeData = jsonDecode(result);
    return _allNodeData;
  }

  static Future<List<CategoryModel>> getAllNodes() async {
    dynamic json = await getAllNodeData();
    dynamic jsonArray = json['categories'];
    List<CategoryModel> result = [];
    for(dynamic cat in jsonArray) {
      result.add(CategoryModel.fromJson(cat));
    }
    return result;
  }
}
