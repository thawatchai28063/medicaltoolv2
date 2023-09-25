// To parse this JSON data, do
//
//     final modeluser = modeluserFromJson(jsonString);

import 'dart:convert';

List<Modeluser> modeluserFromJson(String str) =>
    List<Modeluser>.from(json.decode(str).map((x) => Modeluser.fromJson(x)));

String modeluserToJson(List<Modeluser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modeluser {
  String? code;
  String? name;

  Modeluser({
    this.code,
    this.name,
  });

  factory Modeluser.fromJson(Map<String, dynamic> json) => Modeluser(
        code: json["Code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "name": name,
      };
}
