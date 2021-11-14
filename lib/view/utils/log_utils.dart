import 'dart:developer';

import 'package:flutter/foundation.dart';

class LogUtils {
  static debugLog(String str) {
    if (kDebugMode) {
      log(str);
    }
  }
}
