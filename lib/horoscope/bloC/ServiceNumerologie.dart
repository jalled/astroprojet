/*
import '../model/NumerologieModel.dart';

Future<Content?> getSinglePostData(name1, name2) async {
  Content? result;
  try {
    final response = await http.post(
      Uri.parse("https://api.aveniroscope.com/mobile/get-compatibilite-prenom"),
      body: {"name1": name1, "name2": name2},
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = Content.fromJson(item);
    } else {
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}

*/

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<http.Response?> Numerologie(String name1, String name2) async {
  http.Response? response;
  try {
    response = await http.post(
        Uri.parse(
            "https://api.aveniroscope.com/mobile/get-compatibilite-prenom"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: {
          'name1': name1,
          'name2': name2,
        });
  } catch (e) {
    log(e.toString());
  }
  return response;
}
