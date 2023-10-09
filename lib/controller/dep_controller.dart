import 'package:get/get.dart';

import '../model/model_depv2.dart';
import '../remote_service/remote_server.dart';

class dep_controller extends GetxController {
  var isLoading = false.obs;
  var listdep = <Modeldepv2>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fectdep('ALL');
    super.onInit();
  }

  void fectdep(String sn) async {
    isLoading(true);
    var resturnList = await RemoteService.fectgetdep(sn);
    isLoading(false);
    if ((resturnList != null) && resturnList.isNotEmpty) {
      listdep.value = resturnList;
    }
    //  print(resturnList);
  }
}
