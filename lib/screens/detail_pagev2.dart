import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../controller/detail_productcon.dart';

class Detailv2 extends StatefulWidget {
  const Detailv2({super.key});

  @override
  State<Detailv2> createState() => _Detailv2State();
}

class _Detailv2State extends State<Detailv2> {
  String val_search = ''; // Initialize val_search
  final productlist = Get.put(product_controller());
  TextEditingController text_find = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 60,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/images/Logo3.png',
              width: 60,
              height: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'ข้อมูลอุปกรณ์',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: text_find,
                    decoration: InputDecoration(
                      labelText: 'กรุณากรอกข้อมูล',
                      hintText: 'กรอกข้อมูล',
                      // contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon:
                          Icon(Icons.search), // Add an icon to the prefix
                    ),
                    onChanged: (value) {
                      setState(() {
                        val_search = value;
                        productlist.listproduct.clear();
                        productlist.fectfindproduct(val_search);
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.qr_code,
                    size: 50,
                  ),
                  onPressed: () async {
                    var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ),
                    );
                    setState(() {
                      if (res is String) {
                        val_search = res;
                        productlist.listproduct.clear();
                        productlist.fectfindproduct(res);
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          text: '$res',
                        );
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Value: $val_search'),
            // Text(productlist.listproduct.length.toString()),
            Container(
              child: Obx(
                () => productlist.listproduct.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: Text(
                                'กรอกข้อมูล หรือ Scan Barcode',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 5),
                            Image.asset(
                              'assets/images/Doctor1.jpg', // Replace with your image URL
                              width: 250,
                              height: 250,
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(35),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text('ScanResult',
                                      style: TextStyle(fontSize: 24)),
                                  SizedBox(height: 20),
                                  Divider(),
                                  InfoRow(
                                    title: 'แผนก:',
                                    value: productlist.listproduct[0].mdcDep
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'ชื่ออุปกรณ์:',
                                    value: productlist.listproduct[0].mdcName
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'CD :',
                                    value: productlist.listproduct[0].mdcCd
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'Equipment:',
                                    value: productlist
                                        .listproduct[0].mdcEquipment
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'ยี่ฮ้อ:',
                                    value: productlist.listproduct[0].mdcYeeho
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'อาคาร:',
                                    value: productlist.listproduct[0].mdcUbr
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'พื้นที่:',
                                    value: productlist
                                        .listproduct[0].mdcLocation
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'last:',
                                    value: productlist
                                        .listproduct[0].mdcCostlast
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'ชื่ออุปกรณ์:',
                                    value: productlist.listproduct[0].mdcName
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final TextAlign textAlign;

  InfoRow({
    required this.title,
    required this.value,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
            textAlign: textAlign, // ตั้งค่าให้เป็น TextAlign.center ที่นี่
          ),
        ),
      ],
    );
  }
}
