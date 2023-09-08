import 'package:get/get.dart';
import 'package:medicaltoolv2/remote_service/remote_server.dart';
import 'package:get_storage/get_storage.dart';
import '../model/MdcModel.dart';

class product_controller extends GetxController {
  var isLoading = false.obs;
  var listproduct = <MdcModel>[].obs;
  final storage = GetStorage();
  @override
  void fectfindproduct(String sn) async {
    isLoading(true);
    var resturnList = await RemoteService.fectmdcid(sn);
    isLoading(false);
    if ((resturnList != null) && resturnList.isNotEmpty) {
      listproduct.value = resturnList;
      print('mdcDep' + listproduct[0].mdcDep.toString());
      storage.write('mdcDep', listproduct[0].mdcDep.toString());
      storage.write('mdcName', listproduct[0].mdcName.toString());
      storage.write('mdcCd', listproduct[0].mdcCd.toString());
      storage.write('mdcId', listproduct[0].mdcId.toString());
      storage.write('mdcEquipment', listproduct[0].mdcEquipment.toString());
      storage.write('mdcYeeho', listproduct[0].mdcYeeho.toString());
      storage.write('mdcUbr', listproduct[0].mdcUbr.toString());
      storage.write('mdcLocation', listproduct[0].mdcLocation.toString());
      storage.write('mdcCostlast', listproduct[0].mdcCostlast.toString());
      storage.write('mdcRun', listproduct[0].mdcRun.toString());
      storage.write('mdcDoc', listproduct[0].mdcDoc.toString());
      //print('mdcDep=' + storage.read('mdcDep'));
    }
    print(resturnList);
  }

  fetchProductByDepartment(String level1) {}
}
