import 'package:halonodeviewer/category_model.dart';
import 'package:halonodeviewer/logic_model.dart';
import 'package:halonodeviewer/object_type.dart';

class NodeModel {
  static NodeModel fromJson(CategoryModel categoryModel, dynamic json) {
    dynamic inputs = json['inputs'];
    dynamic outputs = json['outputs'];

    List<ParameterType> inputTypes = [];
    List<ParameterType> outputTypes = [];

    for(dynamic child in inputs) {
      inputTypes.add(ParameterType.fromJson(child));
    }

    for(dynamic child in outputs) {
      outputTypes.add(ParameterType.fromJson(child));
    }

    String name = json['name'];
    String description = json['description'];
    String type = json['type'];
    String category = json['category'];
    LogicModel logicModel = LogicModel.fromJson(json['flow']);

    return NodeModel._internal(inputs: inputTypes, outputs: outputTypes, name: name, type: type, category: categoryModel, description: description, logicModel: logicModel);
  }

  List<ParameterType> inputs;
  List<ParameterType> outputs;
  String name;
  String type;
  CategoryModel category;
  String description;
  LogicModel logicModel;


  NodeModel._internal({required this.inputs, required this.outputs, required this.name, required this.type, required this.category, required this.description, required this.logicModel });


  String toString() {
    return "{name: $name, type: $type, description: $description, category: ${category.name}, inputs: $inputs, outputs: $outputs}";
  }

}
