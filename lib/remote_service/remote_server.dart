import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:medicaltoolv2/model/model_dep.dart';
import 'package:medicaltoolv2/model/UserModel';
import '../model/MdcModel.dart';
import '../model/model_get.dart';
import '../model/modeluser.dart';
import '../utility/api_domain.dart';
import 'dart:convert';

final storage = GetStorage();

class RemoteService {
  static var client = http.Client();
//qrcode
  static Future<List<MdcModel>?> fectmdcid(String sn) async {
    Map<String, String> queryParam = {
      'SN': sn,
    };

    var respon = await client.get(
      Uri.https(apidomain, apiGetproduct, queryParam),
    );
    // print(apidomain);
    // print(respon);

    //  print('statusCode' + respon.statusCode.toString());
    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      if (jsonString != 'null') {
        //print(jsonString);
        return mdcModelFromJson(jsonString);
      } else {
        return null;
      }
    }
    return null;
  }

//แผนก
  static Future<List<ModelDep>?> fectgetdep(String sn) async {
    Map<String, String> queryParam = {
      'SN': sn,
    };

    var respon = await client.get(
      Uri.http(apidomain, apigetdep, queryParam),
    );

    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      if (jsonString != 'null') {
        //print(jsonString);
        return modelDepFromJson(jsonString);
      } else {
        return null;
      }
    }
    return null;
  }

//getยืม
  static Future<List<ModelGet>?> fectgetborrow(String sn) async {
    Map<String, String> queryParam = {
      'SN': sn,
    };

    var respon = await client.get(
      Uri.http(apidomain, apigetborrow, queryParam),
    );

    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      if (jsonString != 'null') {
        print(jsonString);
        return modelGetFromJson(jsonString);
      } else {
        return null;
      }
    }
    return null;
  }

//getคืน
  static Future<List<ModelGet>?> fectgetreturn(String sn) async {
    Map<String, String> queryParam = {
      'SN': sn,
    };

    var respon = await client.get(
      Uri.http(apidomain, apigetreturn, queryParam),
    );

    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      if (jsonString != 'null') {
        //print(jsonString);
        return modelGetFromJson(jsonString);
      } else {
        return null;
      }
    }
    return null;
  }

  //employee
  static Future<String?> fectemployee(String sn) async {
    Map<String, String> queryParam = {
      'SN': sn,
    };

    var respon = await client.get(
      Uri.http(apidomain, apiuser, queryParam),
    );
    //  print(apiin);
    // print(respon);

    //  print('statusCode' + respon.statusCode.toString());
    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      if (jsonString != 'null') {
        //  print(jsonString);
        return jsonString; // modeluserFromJson(jsonString);
      } else {
        return null;
      }
    }
    return null;
  }

  //login
  static Future<List<UserModel>?> loginmedicaltool(String em_cd, pass) async {
    Map<String, String> queryParam = {
      'em_cd': em_cd,
      'pass': pass,
    };
    var respon = await client.get(
      Uri.http(apidomain, apiGetUser, queryParam),
    );
    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      print(jsonString);

      // ตรวจสอบว่า jsonString เป็น "NO" หรือไม่
      if (jsonString.trim() == "NO") {
        // print("Server returned 'NO'."); // แสดงข้อความเตือน
        // return null;
      }

      try {
        // แปลง JSON เป็น List<UserModel>
        List<UserModel> users = (json.decode(jsonString) as List)
            .map((data) => UserModel.fromJson(data))
            .toList();
        storage.write('user_data', json.encode(users));
        // print(storage);
        return users;
      } catch (e) {
        print('Error parsing JSON: $e');
      }
    }
    return null;
  }
}
