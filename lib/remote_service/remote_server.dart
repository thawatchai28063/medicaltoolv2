import 'package:http/http.dart' as http;
import 'package:medicaltoolv2/model/model_dep.dart';

import '../model/MdcModel.dart';
import '../model/model_get.dart';
import '../model/modeluser.dart';
import '../utility/api_domain.dart';

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
      Uri.http(apiin, apigetdep, queryParam),
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
      Uri.http(apiin, apigetborrow, queryParam),
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
      Uri.http(apiin, apigetreturn, queryParam),
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
      Uri.http(apiin, apiuser, queryParam),
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
}
