import 'package:flutter/material.dart';
import 'package:halonodeviewer/node_model.dart';
import 'package:string_similarity/string_similarity.dart';

class CategoryModel {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  static CategoryModel fromJson(dynamic json) {
    String name = json['name'];
    String description = json['description'];
    String hexColor = json['color'];
    List<NodeModel> children = [];
    dynamic unmodded = json['children'];
    CategoryModel categoryModel = CategoryModel._internal(name, description, children, fromHex(hexColor));
    for(dynamic child in unmodded) {
      children.add(NodeModel.fromJson(categoryModel, child));
    }
    categoryModel.children = children;
    return categoryModel;
  }

  String name;
  String description;
  List<NodeModel> children;
  Color color;

  CategoryModel._internal(this.name, this.description, this.children, this.color);

  List<dynamic> getSearchResults(String query) {
    List<dynamic> results = [];

    for(NodeModel child in children) {
      results.add({
        "body": child,
        "similarity": query.similarityTo(child.toString())
      });
    }

    results.sort((a, b) => b['similarity'].compareTo(a['similarity']));

    return results;
  }

  double getTotalSimilarity(String query) {
    List<dynamic> results = getSearchResults(query);
    double total = 0.0;
    int count = 0;
    for(dynamic result in results) {
      total += result['similarity'];
      count++;
      if(count == 3) break;
    }
    return total;
  }

  @override
  String toString() {
    return "{name: $name, description: $description, children: ${children.toString()}}";
  }
}
