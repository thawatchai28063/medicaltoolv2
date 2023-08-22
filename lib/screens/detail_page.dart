import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicaltoolv2/remote_service/remote_server.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../controller/detail_productcon.dart';
import '../model/MdcModel.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<MdcModel> mdcListsn = [];

  @override
  Widget build(BuildContext context) {
    String val_search = '';
    String val_barcode = '';
    TextEditingController text_find = TextEditingController();
    final productlist = Get.put(product_controller());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 231, 215),
      appBar: AppBar(
        title: Text('ข้อมูลอุปกรณ์'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Row(
                      children: [
                        Icon(Icons.search), // Add your icon here
                        SizedBox(
                            width:
                                1.6), // Add some space between the icon and text
                        Text(
                          "ค้นข้อมูล",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: () {
                      productlist.fectfindproduct('${val_search}');
                      // RemoteService.fectmdcid('18-21-5511-0004');
                      //  getproductinfo('18-21-5511-0004');
                      // QuickAlert.show(
                      //   context: context,
                      //   type: QuickAlertType.error,
                      //   title: 'Data Scan ',
                      //   text: val_search,
                      //   confirmBtnText: 'OK',
                      // );
                      // getproductinfo(val_search);
                    },
                  ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  ElevatedButton(
                    child: Row(
                      children: [
                        Icon(Icons.qr_code), // Add your icon here
                        SizedBox(
                            width:
                                1.6), // Add some space between the icon and text
                        Text(
                          "Scanned QR Code",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      setState(() {
                        if (res is String) {
                          productlist.fectfindproduct(res);
                          // getproductinfo(res);
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: '${res}',
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              width: 300,
            ),
            Container(
              height: 100,
              width: 300,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3, color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'กรุณากรอกข้อมูล',
                      hintText: 'กรอกข้อมูล',
                      contentPadding: EdgeInsets.all(50.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        val_search = value;
                      });
                    },
                  ),
                  height: 20,
                ),
              ),
            ),
            Text('Value: $val_search'),
            Text(productlist.listproduct.length.toString()),
            Container(
              child: Obx(
                () => productlist.listproduct.isEmpty
                    ? Center(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Text('กรอกข้อมูล หรือ Scan Barcode '),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(35),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 209, 207, 202),
                            border:
                                Border.all(width: 1.6, color: Colors.black12),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Text('SacanResult'),
                              Text(
                                'แผนก  :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcDep.toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              Text(
                                'ชื่ออุปกรณ์   :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcName.toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'CD  :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcCd.toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              Text(
                                'Equipment :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcEquipment
                                    .toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              Text(
                                'ยี่ฮ้อ   :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcYeeho.toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              Text(
                                'อาคาร',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcUbr.toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              Text(
                                'พื้นที่   :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcLocation
                                    .toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              Text(
                                'last    :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productlist.listproduct[0].mdcCostlast
                                    .toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            Text('Value: $val_search'),
          ],
        ),
      ),
    );
  }

  // Future<void> getproductinfo(String sn) async {
  //   mdcListsn.clear();
  //   mdcListsn = (await RemoteService.fectmdcid(sn))!;
  //   if (mdcListsn.isNotEmpty) {
  //     setState(() {});
  //   }
  // }
}
