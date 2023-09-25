import 'package:get/get.dart';

import '../model/model_dep.dart';
import '../model/model_get.dart';
import '../remote_service/remote_server.dart';
import 'package:get_storage/get_storage.dart';

class getborrow_controller extends GetxController {
  var isLoading = false.obs;
  var listborrow = <ModelGet>[].obs;
  final storage = GetStorage();
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
      print('mdcDep' + listborrow[0].mdcDep.toString());
      storage.write('mdcDep', listborrow[0].mdcDep.toString());
      storage.write('mdcName', listborrow[0].mdcName.toString());
      storage.write('mdcCd', listborrow[0].mdcCd.toString());
      storage.write('mdcId', listborrow[0].mdcId.toString());
      storage.write('mdcEquipment', listborrow[0].mdcEquipment.toString());
      storage.write('mdcYeeho', listborrow[0].mdcYeeho.toString());
      storage.write('mdcUbr', listborrow[0].mdcUbr.toString());
      storage.write('mdcLocation', listborrow[0].mdcLocation.toString());
      storage.write('mdcCostlast', listborrow[0].mdcCostlast.toString());
      storage.write('mdcRun', listborrow[0].mdcRun.toString());
      storage.write('mdcDoc', listborrow[0].mdcDoc.toString());
      storage.write('mdcStsName', listborrow[0].mdcStsName.toString());
      storage.write('mdcPrice', listborrow[0].mdcPrice.toString());
      print('mdcDep=' + storage.read('mdcDep'));
    }
    print(resturnList);
  }
}
