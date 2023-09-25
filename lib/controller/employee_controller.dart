import 'package:get/get.dart';
import 'package:medicaltoolv2/remote_service/remote_server.dart';
import 'package:get_storage/get_storage.dart';
import '../model/modeluser.dart';

class employee_controller extends GetxController {
  var isLoading = false.obs;
  var listemployee = <Modeluser>[].obs;
  final storage = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    // fectemployee('ALL');
    super.onInit();
  }

  // void fectemployee(String sn) async {
  //   isLoading(true);
  //   print('controllersn=$sn');
  //   var resturnList = await RemoteService.fectemployee(sn);
  //   // print(resturnList);
  //   isLoading(false);
  //   if ((resturnList != null) && resturnList.isNotEmpty) {
  //     listemployee.value = resturnList;
  //   }
  //   print(resturnList);
  // }

  fetchProductByDepartment(String level1) {}
}
