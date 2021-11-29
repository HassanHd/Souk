import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class About{
  static fetchAbout() async {
    print("fetchAbout---->");
    try {
      var url =
      Uri.parse("https://www.srcform.com/aboutusandpolicy");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      // If the call to the server was successful, parse the JSON
      var responseBody = jsonDecode(response.body)["aboutus"];
      print(responseBody);
      return responseBody;
    } catch (e) {
      print(e);
    }
  }
}