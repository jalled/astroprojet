class NumerologieModel {
  bool? success;
  List<Content>? content;

  NumerologieModel({this.success, this.content});

  NumerologieModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
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

class Content {
  int? id;
  int? number1;
  int? number2;
  String? content;

  Content({this.id, this.number1, this.number2, this.content});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number1 = json['number1'];
    number2 = json['number2'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number1'] = this.number1;
    data['number2'] = this.number2;
    data['content'] = this.content;
    return data;
  }
}
