extension ListExtensions on List {
  List<T> mapToType<T>(Function handler) {
    List<T> result = [];
    for (var i = 0; i < this.length; i++) {
      result.add(handler(i, this[i]));
    }
    return result;
  }
}

extension StringExtensions on String? {
  String orDefault({String defaultStr = ""}) {
    if (this == null) {
      return defaultStr;
    } else {
      return this!;
    }
  }

  String removeTrailingZeros({String defaultStr = ""}) {
    if (this == null) {
      return defaultStr;
    } else {
      RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
      return this!.replaceAll(regex, "");
    }
  }
}

extension IntegerExtensions on int? {
  bool isValidId() {
    return this != null && this != -1 && this != 0;
  }
}
