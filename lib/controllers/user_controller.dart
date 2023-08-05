import 'package:tt9_betweener_challenge/controllers/pref_controller.dart';

import '../models/user.dart';

Future<User> getLocalUser() async {
  SharedPrefController prefsController = SharedPrefController.instance;
  if (prefsController.pref.containsKey('user')) {
    String userJson = prefsController.pref.getString('user')!;
    return userFromJson(userJson);
  }
  return Future.error('not found');
}
