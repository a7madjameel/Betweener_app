// ignore_for_file: unused_local_variable

import 'package:tt9_betweener_challenge/controllers/api_controller.dart';
import 'package:tt9_betweener_challenge/controllers/pref_controller.dart';
import 'package:tt9_betweener_challenge/utilis/constants.dart';

import '../models/link.dart';

class LinksController {
  Future<Link> addLink({
    required String title,
    required String link,
  }) async {
    var data = await ApiController().post(url: linksUrl, body: {
      'title': title,
      'link': link.toString(),
      'username': SharedPrefController.instance.userName,
      'isActive': '0'
    });
    return Link.fromJson(data);
  }

  Future<Link> updateLink({
    required String title,
    required String link,
    required int id,
  }) async {
    var data = await ApiController().put(url: '$linksUrl/$id', body: {
      'title': title,
      'link': link,
    });
    return Link.fromJson(data);
  }

  Future<List<Link>> getLinks(context) async {
    final data = await ApiController().get(url: linksUrl);
    var res = data['links'] as List<dynamic>;
    return res.map((e) => Link.fromJson(e)).toList();
  }

  Future<void> deleteLinks({required int id}) async {
    var data = await ApiController().delete(url: "$linksUrl/$id");
  }
}
