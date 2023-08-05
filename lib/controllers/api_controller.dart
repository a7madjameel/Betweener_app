import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tt9_betweener_challenge/controllers/pref_controller.dart';

class ApiController {
  //Method get to get data from the api
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: SharedPrefController.instance.token
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  //Method post to send data to the api
  Future<dynamic> post({required String url, dynamic body}) async {
    http.Response response = await http.post(Uri.parse(url),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: SharedPrefController.instance.token
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  //Method update
  Future<dynamic> put({required String url, dynamic body}) async {
    http.Response response = await http.put(Uri.parse(url),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: SharedPrefController.instance.token
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  //Method delete
  Future<dynamic> delete({required String url, dynamic body}) async {
    http.Response response = await http.delete(Uri.parse(url),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: SharedPrefController.instance.token
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
