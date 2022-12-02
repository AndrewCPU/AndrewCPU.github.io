class LogicModel {
  static LogicModel fromJson(dynamic model) {
    return LogicModel._internal(model['in'], model['out'], model['other']);
  }

  bool flowIn;
  bool flowOut;
  bool? flowOther;

  LogicModel._internal(this.flowIn, this.flowOut, this.flowOther);
}
