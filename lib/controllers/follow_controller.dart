// ignore_for_file: avoid_print

import 'package:tt9_betweener_challenge/controllers/api_controller.dart';
import 'package:tt9_betweener_challenge/models/follow_statistic.dart';
import 'package:tt9_betweener_challenge/utilis/constants.dart';

class FollowController {
  Future<Follow> getFollow() async {
    var data = await ApiController().get(url: followUrl);
    return Follow.fromJson(data);
  }

  Future<dynamic> addFollow({required String id}) async {
    var data =
        await ApiController().post(url: followUrl, body: {'followee_id': id});
    print(data);
  }
}
