import 'dart:developer';

import 'package:intl/intl.dart';

import 'log_utils.dart';

class NumberUtils {
  RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
  static String formatQuantity(double? v) {
    if (v == null) return '';

    final formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(v);
  }

  static double calculateDiscount(String? specialPrice, String? price) {
    if (specialPrice == null || specialPrice.isEmpty) {
      LogUtils.debugLog("In discount calculation: Special price is null or empty");
      return 0;
    }
    if (price == null || price.isEmpty) {
      LogUtils.debugLog("In discount calculation: Price is null or empty");
      return 0;
    }

    final p = double.parse(price);
    final sp = double.parse(specialPrice);

    if (p <= 0) {
      LogUtils.debugLog("In discount calculation: Parsed price is less than 0");
      return 0;
    }

    final discount = (p - sp) * 100 / p;
    log("Discount is $discount");

    return discount;
  }
}
