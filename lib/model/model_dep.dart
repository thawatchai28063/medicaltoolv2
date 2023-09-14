// To parse this JSON data, do
//
//     final modelDep = modelDepFromJson(jsonString);

import 'dart:convert';

List<ModelDep> modelDepFromJson(String str) =>
    List<ModelDep>.from(json.decode(str).map((x) => ModelDep.fromJson(x)));

String modelDepToJson(List<ModelDep> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelDep {
  String? depcode;
  String? depname;

  ModelDep({
    this.depcode,
    this.depname,
  });

  factory ModelDep.fromJson(Map<String, dynamic> json) => ModelDep(
        depcode: json["depcode"],
        depname: json["depname"],
      );

  Map<String, dynamic> toJson() => {
        "depcode": depcode,
        "depname": depname,
      };
}
