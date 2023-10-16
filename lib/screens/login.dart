import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:get_storage/get_storage.dart';
import '../remote_service/remote_server.dart';
import '../utility/api_domain.dart';

final storage = GetStorage();

class LoginPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxString errorMessage =
      ''.obs; // Use RxString for reactive error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // child: Image.asset(
            //   'assets/images/img11.jpg',
            //   fit: BoxFit.cover,
            // ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 350,
                width: 150,
                child: Lottie.network(
                  'https://lottie.host/655abf68-7d78-454d-a596-be01a8cfbffe/iPVBApybKe.json',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  border: Border.all(width: 1.2, color: Colors.purple),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'รหัสพนักงาน',
                    hintText: 'กรุณากรอกรหัสพนักงาน',
                    contentPadding: EdgeInsets.all(20.0),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอก ID';
                    }
                    return null;
                  },
                  controller: idController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  border: Border.all(width: 1.2, color: Colors.purple),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    hintText: 'กรุณากรอกรหัสผ่าน',
                    contentPadding: EdgeInsets.all(20.0),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอกรหัสผ่าน';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 20,
                height: 70, // เปลี่ยนความสูงให้เท่ากับ 70
                margin: EdgeInsets.symmetric(horizontal: 35.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.pink, // สีขอบ
                    width: 2.0, // ความหนาขอบ
                  ),
                  borderRadius: BorderRadius.circular(10.0), // ขอบContainer
                ),
                child: MaterialButton(
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(fontSize: 25),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () async {
                    final em_cd = idController.text;
                    final pass = passwordController.text;

                    if (em_cd.isEmpty || pass.isEmpty) {
                      // แจ้งเตือน
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: 'กรุณากรอกรหัสผ่าน',
                        confirmBtnText: 'OK',
                      );
                      // errorMessage.value = 'กรุณากรอกทั้ง ID และรหัสผ่าน';
                      return;
                    } else {
                      fetchUserData(context, em_cd, pass);
                    }

                    final userModels =
                        await RemoteService.loginmedicaltool(em_cd, pass);

                    // print(userModels);

                    if (userModels != null && userModels.isNotEmpty) {
                      // QuickAlert.show(
                      //   context: context,
                      //   type: QuickAlertType.success,
                      //   text: 'เข้าสู่ระบบ',
                      //   confirmBtnText: 'OK',
                      // );
                      Get.offNamed('/');
                    }
                    //else if (userModels != null && userModels[0] == "NO") {
                    //   // แสดง QuickAlert เมื่อข้อมูลเป็น "NO"
                    //   QuickAlert.show(
                    //     context: context,
                    //     type: QuickAlertType.error,
                    //     text: 'รหัสไม่ถูกต้อง กรุณาลองอีกครั้ง',
                    //     confirmBtnText: 'OK',
                    //   );
                    // } else if (userModels == null) {
                    //   // แสดง QuickAlert เมื่อข้อมูลเป็น null
                    //   QuickAlert.show(
                    //     context: context,
                    //     type: QuickAlertType.error,
                    //     text: 'รหัสไม่ถูกต้อง กรุณาลองอีกครั้ง',
                    //     confirmBtnText: 'OK',
                    //   );
                    // } else {
                    //   errorMessage.value = 'รหัสไม่ถูกต้อง กรุณาลองอีกครั้ง';
                    // }
                  },
                ),
              ),
              Obx(() => errorMessage.value.isNotEmpty
                  ? Center(
                      child: Text(
                        errorMessage.value,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : SizedBox.shrink()),
            ],
          ),
        ],
      ),
    );
  }

  void fetchUserData(context, String em_cd, String pass) async {
    Map<String, String> queryParam = {
      'em_cd': em_cd,
      'pass': pass,
    };
    var respon = await http.get(
      Uri.https(apidomain, apiGetUser, queryParam),
    );
    print(respon.body);

    if (respon.statusCode == 200) {
      var jsonString = respon.body;
      print(jsonString);

      // ตรวจสอบว่า jsonString เป็น "NO" หรือไม่
      if (jsonString.trim() == "NO") {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'รหัสไม่ถูกต้อง กรุณาลองอีกครั้ง',
          confirmBtnText: 'OK',
        );
        // print("Server returned 'NO'."); // แสดงข้อความเตือน
      } else {
        var jsonString = jsonDecode(respon.body);
        var name = jsonString[0]['name'];
        var em_cd = jsonString[0]['em_cd'];
        var pass = jsonString[0]['Code'];
        storage.write('user', name);
        storage.write('em_cd', em_cd);
        storage.write('pass', pass);
        print(name);
        print(em_cd);
        print(pass);
      }
    }
  }
}
