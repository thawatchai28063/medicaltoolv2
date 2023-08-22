import 'package:get/get.dart';
import 'package:medicaltoolv2/remote_service/remote_server.dart';

import '../model/MdcModel.dart';

class product_controller extends GetxController {
  var isLoading = false.obs;
  var listproduct = <MdcModel>[].obs;
  @override
  void fectfindproduct(String sn) async {
    isLoading(true);
    var resturnList = await RemoteService.fectmdcid(sn);
    isLoading(false);
    if ((resturnList != null) && resturnList.isNotEmpty) {
      listproduct.value = resturnList;
    }
    print(resturnList);
  }
}
