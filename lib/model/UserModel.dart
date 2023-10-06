// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    String? emCd;
    String? code;
    String? name;

    UserModel({
        this.emCd,
        this.code,
        this.name,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        emCd: json["em_cd"],
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "em_cd": emCd,
        "Code": code,
        "name": name,
    };
}
