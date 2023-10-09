// To parse this JSON data, do
//
//     final modeldepv2 = modeldepv2FromJson(jsonString);

import 'dart:convert';

List<Modeldepv2> modeldepv2FromJson(String str) =>
    List<Modeldepv2>.from(json.decode(str).map((x) => Modeldepv2.fromJson(x)));

String modeldepv2ToJson(List<Modeldepv2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modeldepv2 {
  String? depname;

  Modeldepv2({
    this.depname,
  });

  factory Modeldepv2.fromJson(Map<String, dynamic> json) => Modeldepv2(
        depname: json["depname"],
      );

  Map<String, dynamic> toJson() => {
        "depname": depname,
      };
}
