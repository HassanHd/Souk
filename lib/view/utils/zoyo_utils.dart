import 'dart:convert';

import 'package:intl/intl.dart';

class ZoyoUtils {
  static bool isLoggedIn = false;
  static int currentAddingProductId = -1;
  static bool productAddingInProgress = false;
  static String? currentAuthToken;

  static markProductAdding(int productId) {
    currentAddingProductId = productId;
    productAddingInProgress = true;
  }

  static unMarkProductAdding() {
    currentAddingProductId = -1;
    productAddingInProgress = false;
  }

  static bool toShowProductInPlaceProgress(int productId) {
    return productAddingInProgress && currentAddingProductId == productId;
  }

  // static String identifyOrderStatus(String? status) {
  //   switch (status) {
  //     case OrderStatus.PENDING:
  //       return "Order Placed";
  //     case OrderStatus.PROCESSING:
  //       return "Out for Delivery";
  //     case OrderStatus.CANCELED:
  //       return "Canceled";
  //     case OrderStatus.COMPLETED:
  //       return "Delivered";
  //     case OrderStatus.CLOSED:
  //       return "Refunded";
  //     default:
  //       return "";
  //   }
  // }

  // static String createAddressString(Address? value) {
  //   if (value == null) return "";
  //   var str = "";
  //   if (value.companyName.isNotEmpty) {
  //     str = value.companyName + "\n";
  //   }
  //   str = "$str${value.firstName} ${value.lastName}"
  //       "\n${value.address1.first}, ${value.city} ${value.state} ${value.countryName} - ${value.postcode}\n${value.phone}";
  //
  //   return str;
  // }

  static String formatDate(String? createdDate) {
    if (createdDate != null && createdDate.isNotEmpty) {
      final dateFormat = "E, d MMM yyyy";
      return DateFormat(dateFormat).format(DateTime.parse(createdDate));
    }
    return "";
  }

  // static parseErrorToString(BasicErrorResponse errorResponse,
  //     {String defaultErrorMsg = "Error Occurred"}) {
  //   if (errorResponse.errors == null) {
  //     if (errorResponse.message == null) {
  //       if (errorResponse.error == null) {
  //         LogUtils.debugLog("Error parsing every thing is null");
  //         return defaultErrorMsg;
  //       } else {
  //         return errorResponse.error;
  //       }
  //     } else {
  //       return errorResponse.message;
  //     }
  //   } else {
  //     try {
  //       final errorsMap = errorResponse.errors as Map<String, dynamic>;
  //       String parsedError = "";
  //       errorsMap.forEach((key, value) {
  //         if (value is List) {
  //           parsedError = parsedError + "\n" + value[0];
  //         } else {
  //           parsedError = parsedError + "\n" + value.toString();
  //         }
  //       });
  //       return parsedError.isEmpty ? defaultErrorMsg : parsedError;
  //     } catch (Exception) {
  //       LogUtils.debugLog("Error parsing exception case");
  //       return defaultErrorMsg;
  //     }
  //   }
  // }

  // static Future<String?> identifyToken() async {
  //   if (currentAuthToken == null || currentAuthToken!.isEmpty) {
  //     final flutterSecureStorage = FlutterSecureStorage();
  //     currentAuthToken = await flutterSecureStorage.read(key: "auth_token");
  //   }
  //   return currentAuthToken;
  // }
  //
  // static Future<String?> findUserDetail() {
  //   return FlutterSecureStorage().read(key: KeyConstants.USER_DETAIL);
  // }
  //
  // static Future<LoginRequest?> createLoginRequest() async {
  //   String? email;
  //   String? password;
  //   email = await FlutterSecureStorage().read(key: KeyConstants.USER_EMAIL);
  //   password =
  //       await FlutterSecureStorage().read(key: KeyConstants.USER_PASSWORD);
  //
  //   if (email != null && email.isNotEmpty) {
  //     return LoginRequest(email, password ?? "");
  //   } else {
  //     return null;
  //   }
  // }
  //
  // static saveToken(String token) async {
  //   await FlutterSecureStorage()
  //       .write(key: KeyConstants.AUTH_TOKEN, value: token);
  // }
  //
  // static saveUserDetails(LoginResponse loginResponse,
  //     {LoginRequest? loginRequest}) async {
  //   final secureStorage = FlutterSecureStorage();
  //   await secureStorage.write(
  //       key: KeyConstants.USER_DETAIL, value: jsonEncode(loginResponse.data));
  //   await secureStorage.write(key: "auth_token", value: loginResponse.token);
  //   if (loginRequest != null) {
  //     await secureStorage.write(
  //         key: KeyConstants.USER_EMAIL, value: loginRequest.email);
  //     await secureStorage.write(
  //         key: KeyConstants.USER_PASSWORD, value: loginRequest.password);
  //   }
  // }
}
