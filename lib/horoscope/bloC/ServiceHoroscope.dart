import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/HoscopeModel.dart';

class UserApi {
  static UserApi _instance = UserApi._();

  UserApi._();

  static UserApi get instance {
    if (_instance == null) {
      _instance = UserApi._();
    }
    return _instance;
  }

  Future<List<Horoscope>> getHoroscope() async {
    var _myUrl =
        'https://api.aveniroscope.com/mobile/get-content-horoscope-by-day-and-signe';

    final getUser = await http.post(Uri.parse(_myUrl), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: {});
    final List responseBody = jsonDecode(getUser.body);
    return responseBody.map((e) => Horoscope.fromJson(e)).toList();
  }
}
