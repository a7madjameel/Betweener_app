import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/models/user.dart';

class SharedPrefController {
  static final instance = SharedPrefController._();
  late SharedPreferences pref;
  factory SharedPrefController() {
    return instance;
  }
  SharedPrefController._();
  Future<void> initSharePrefs() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    pref.setBool('logged_in', true);

    pref.setString('accessToken', "Bearer ${user.token}");
    pref.setString('userId', "${user.user!.id}");
    pref.setString('userEmail', "${user.user!.email}");
    pref.setString('userName', "${user.user!.name}");
  }

  bool get loggedIn => pref.getBool('logged_in') ?? false;
  String get token => pref.getString('accessToken') ?? "";
  String get userId => pref.getString('userId') ?? "";
  String get userName => pref.getString('userName') ?? "";
  String get userEmail => pref.getString('userEmail') ?? "";
  Future<bool> logout() async {
    return await pref.clear();
  }
}
