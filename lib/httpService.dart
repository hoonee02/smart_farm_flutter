import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:farm/SensorPage.dart';

class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse('192.168.1.43:5001/loginapp');

  static login(id,pw,context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "id":id,
      "pw":pw,
    });

    // if (response.statusCode == 200) {
    //   print(jsonDecode(response.body));
    //   var json = jsonDecode(response.body);
    //
    //   if (json[0] == 'success') {
    //     await EasyLoading.showSuccess(json[0]);
    //   } else {
    //     EasyLoading.showError(json[0]);
    //   }
    // } else {
    //   await EasyLoading.showError(
    //       "Error Code : ${response.statusCode.toString()}");
    // }
  }
}