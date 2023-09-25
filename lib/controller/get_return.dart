import 'package:get/get.dart';

import '../model/model_dep.dart';
import '../model/model_get.dart';
import '../remote_service/remote_server.dart';
import '../remote_service/remote_server.dart';
import 'package:get_storage/get_storage.dart';

class getreturn_controller extends GetxController {
  var isLoading = false.obs;
  var listreturn = <ModelGet>[].obs;
  final storage = GetStorage();
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
      print('mdcDep' + listreturn[0].mdcDep.toString());
      storage.write('mdcDep', listreturn[0].mdcDep.toString());
      storage.write('mdcName', listreturn[0].mdcName.toString());
      storage.write('mdcCd', listreturn[0].mdcCd.toString());
      storage.write('mdcId', listreturn[0].mdcId.toString());
      storage.write('mdcEquipment', listreturn[0].mdcEquipment.toString());
      storage.write('mdcYeeho', listreturn[0].mdcYeeho.toString());
      storage.write('mdcUbr', listreturn[0].mdcUbr.toString());
      storage.write('mdcLocation', listreturn[0].mdcLocation.toString());
      storage.write('mdcCostlast', listreturn[0].mdcCostlast.toString());
      storage.write('mdcRun', listreturn[0].mdcRun.toString());
      storage.write('mdcDoc', listreturn[0].mdcDoc.toString());
      storage.write('mdcStsName', listreturn[0].mdcStsName.toString());
      storage.write('mdcPrice', listreturn[0].mdcPrice.toString());
      print('mdcDep=' + storage.read('mdcDep'));
    }
    //  print(resturnList);
  }
}
