// To parse this JSON data, do
//
//     final horoscopeHiver = horoscopeHiverFromJson(jsonString);

import 'dart:convert';

HoroscopeHiver horoscopeHiverFromJson(String str) =>
    HoroscopeHiver.fromJson(json.decode(str));

String horoscopeHiverToJson(HoroscopeHiver data) => json.encode(data.toJson());

class HoroscopeHiver {
  HoroscopeHiver({
    required this.success,
    required this.content,
  });

  bool success;
  List<ContentH> content;

  factory HoroscopeHiver.fromJson(Map<String, dynamic> json) => HoroscopeHiver(
        success: json["success"],
        content: List<ContentH>.from(
            json["content"].map((x) => ContentH.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class ContentH {
  ContentH({
    required this.id,
    required this.couple,
    required this.single,
    required this.money,
    required this.work,
    required this.vitality,
    required this.advice,
    required this.advicePeriod,
    required this.sign,
  });

  int id;
  String couple;
  String single;
  String money;
  String work;
  String vitality;
  String advice;
  String advicePeriod;
  String sign;

  factory ContentH.fromJson(Map<String, dynamic> json) => ContentH(
        id: json["id"],
        couple: json["couple"],
        single: json["single"],
        money: json["money"],
        work: json["work"],
        vitality: json["vitality"],
        advice: json["advice"],
        advicePeriod: json["advicePeriod"],
        sign: json["sign"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "couple": couple,
        "single": single,
        "money": money,
        "work": work,
        "vitality": vitality,
        "advice": advice,
        "advicePeriod": advicePeriod,
        "sign": sign,
      };
}
