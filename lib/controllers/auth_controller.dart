import 'package:http/http.dart' as http;
import 'package:tt9_betweener_challenge/utilis/constants.dart';
import 'package:tt9_betweener_challenge/models/user.dart';

class AuthController {
  Future<User> login(Map<String, String> body) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: body,
    );

    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<User> register(Map<String, String> body) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      body: body,
    );

    if (response.statusCode == 201) {
      return userFromJson(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }
}
