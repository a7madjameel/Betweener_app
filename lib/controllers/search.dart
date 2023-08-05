import 'package:tt9_betweener_challenge/controllers/api_controller.dart';
import 'package:tt9_betweener_challenge/utilis/constants.dart';

class Search {
  Future<List<dynamic>> searchByName({required String name}) async {
    var res = await ApiController().post(url: searchUrl, body: {'name': name});
    List<dynamic> data = res['user'];

    return data;
  }
}
