class Horoscope {
  bool? success;
  List<Contents>? content;

  Horoscope({this.success, this.content});

  Horoscope.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['content'] != null) {
      content = <Contents>[];
      json['content'].forEach((v) {
        content!.add(new Contents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contents {
  int? id;
  String? phrase;
  String? love;
  String? argent;
  String? family;
  String? advice;
  int? loveRate;
  int? familyRate;
  int? argentRate;
  int? assignedId;
  String? signName;
  String? gender;
  String? type;

  Contents(
      {this.id,
      this.phrase,
      this.love,
      this.argent,
      this.family,
      this.advice,
      this.loveRate,
      this.familyRate,
      this.argentRate,
      this.assignedId,
      this.signName,
      this.gender,
      this.type});

  Contents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phrase = json['phrase'];
    love = json['love'];
    argent = json['argent'];
    family = json['family'];
    advice = json['advice'];
    loveRate = json['loveRate'];
    familyRate = json['familyRate'];
    argentRate = json['argentRate'];
    assignedId = json['assignedId'];
    signName = json['signName'];
    gender = json['gender'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phrase'] = this.phrase;
    data['love'] = this.love;
    data['argent'] = this.argent;
    data['family'] = this.family;
    data['advice'] = this.advice;
    data['loveRate'] = this.loveRate;
    data['familyRate'] = this.familyRate;
    data['argentRate'] = this.argentRate;
    data['assignedId'] = this.assignedId;
    data['signName'] = this.signName;
    data['gender'] = this.gender;
    data['type'] = this.type;
    return data;
  }
}
