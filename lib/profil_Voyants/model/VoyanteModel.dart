// To parse this JSON data, do
//
//     final voyants = voyantsFromJson(jsonString);

import 'dart:convert';

Voyants voyantsFromJson(String str) => Voyants.fromJson(json.decode(str));

String voyantsToJson(Voyants data) => json.encode(data.toJson());

class Voyants {
  Voyants({
    required this.success,
    required this.voyant,
  });

  bool success;
  List<VoyantObject> voyant;

  factory Voyants.fromJson(Map<String, dynamic> json) => Voyants(
        success: json["success"],
        voyant: List<VoyantObject>.from(
            json["voyant"].map((x) => VoyantObject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "voyant": List<dynamic>.from(voyant.map((x) => x.toJson())),
      };
}

class VoyantObject {
  VoyantObject({
    required this.id,
    required this.nom,
    required this.avatarPath,
    required this.isActive,
    required this.phoneNumber,
    required this.idForfaitTel,
    required this.description,
    required this.note,
    required this.consultation,
    required this.competenceVoyant,
    required this.idUser,
    required this.available,
    required this.price,
  });

  int id;
  String nom;
  String avatarPath;
  int isActive;
  PhoneNumber phoneNumber;
  int idForfaitTel;
  String description;
  double note;
  int consultation;
  String competenceVoyant;
  int idUser;
  int available;
  double price;

  factory VoyantObject.fromJson(Map<String, dynamic> json) => VoyantObject(
        id: json["id"],
        nom: json["nom"],
        avatarPath: json["avatarPath"],
        isActive: json["isActive"],
        phoneNumber: phoneNumberValues.map[json["phoneNumber"]]!,
        idForfaitTel: json["id_forfait_tel"],
        description: json["description"],
        note: json["note"]?.toDouble(),
        consultation: json["consultation"],
        competenceVoyant: json["competence_voyant"],
        idUser: json["id_user"],
        available: json["available"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "avatarPath": avatarPath,
        "isActive": isActive,
        "phoneNumber": phoneNumberValues.reverse[phoneNumber],
        "id_forfait_tel": idForfaitTel,
        "description": description,
        "note": note,
        "consultation": consultation,
        "competence_voyant": competenceVoyant,
        "id_user": idUser,
        "available": available,
        "price": price,
      };
}

enum PhoneNumber { THE_0428639781 }

final phoneNumberValues =
    EnumValues({"04 28 63 97 81": PhoneNumber.THE_0428639781});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
