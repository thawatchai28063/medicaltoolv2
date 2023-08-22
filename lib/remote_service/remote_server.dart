import 'package:http/http.dart' as http;

import '../model/MdcModel.dart';
import '../utility/api_domain.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<MdcModel>?> fectmdcid(String sn) async {
    Map<String, String> queryParam = {
      'SN': sn,
    };

    var respon = await client.get(
      Uri.https(apidomain, apiGetproduct, queryParam),
    );
    // print(apidomain);
    // print(respon);

    print('statusCode' + respon.statusCode.toString());
    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      if (jsonString != 'null') {
        print(jsonString);
        return mdcModelFromJson(jsonString);
      } else {
        return null;
      }
    }
    return null;
  }
}
