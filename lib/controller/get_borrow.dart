import 'package:get/get.dart';

import '../model/model_dep.dart';
import '../model/model_get.dart';
import '../remote_service/remote_server.dart';

class getborrow_controller extends GetxController {
  var isLoading = false.obs;
  var listborrow = <ModelGet>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fectgetborrow('ALL');
    super.onInit();
  }

  void fectgetborrow(String sn) async {
    isLoading(true);
    var resturnList = await RemoteService.fectgetborrow(sn);
    isLoading(false);
    if ((resturnList != null) && resturnList.isNotEmpty) {
      listborrow.value = resturnList;
    }
    print(resturnList);
  }
}
