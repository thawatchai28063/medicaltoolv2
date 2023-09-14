import 'package:get/get.dart';

import '../model/model_dep.dart';
import '../model/model_get.dart';
import '../remote_service/remote_server.dart';

class getreturn_controller extends GetxController {
  var isLoading = false.obs;
  var listreturn = <ModelGet>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fectgetreturn('ALL');
    super.onInit();
  }

  void fectgetreturn(String sn) async {
    isLoading(true);
    var resturnList = await RemoteService.fectgetreturn(sn);
    isLoading(false);
    if ((resturnList != null) && resturnList.isNotEmpty) {
      listreturn.value = resturnList;
    }
    //  print(resturnList);
  }
}
