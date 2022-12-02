class ParameterType {
  String name;
  String type;

  static ParameterType fromJson(dynamic d) {
      return ParameterType(d.keys.toList()[0], d[d.keys.toList()[0]]);
  }

  String toString() {
    return "{type: $type, name: $name}";
  }

  ParameterType(this.name, this.type);
}
