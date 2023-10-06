import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import '../controller/detail_productcon.dart';
import 'borrowmedicaltool.dart';
import 'returnmedicaltool.dart';
import 'package:get_storage/get_storage.dart';

final storage = GetStorage();

class Detailv2 extends StatefulWidget {
  const Detailv2({super.key});

  @override
  State<Detailv2> createState() => _Detailv2State();
}

class _Detailv2State extends State<Detailv2> {
  String val_search = ''; // Initialize val_search
  // String? mdcDep = storage.read('mdcDep');
  // String? mdcName = storage.read('mdcName');
  // String? mdcCd = storage.read('mdcCd');
  // String? mdcEquipment = storage.read('mdcEquipment');
  // String? mdcYeeho = storage.read('mdcYeeho');
  // String? mdcUbr = storage.read('mdcUbr');
  // String? mdcLocation = storage.read('mdcLocation');
  // String? mdcCostlast = storage.read('mdcCostlast');

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
              mainAxisAlignment: MainAxisAlignment.center,
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.black), // ปรับขอบภาพ
                            ),
                            child: Image.asset(
                              'assets/images/Doctor1.jpg', // Replace with your image URL
                              width: 250,
                              height: 250,
                              fit: BoxFit
                                  .cover, // ปรับขนาดรูปภาพให้พอดีกับ Container
                            ),
                          ),
                        ],
                      ))
                    : SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
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
                                    title: 'รูปภาพ:',
                                    value:
                                        '', // ไม่ต้องใส่ข้อมูลที่ value เนื่องจากจะแสดงภาพที่แทนที่ได้
                                  ),
                                  Divider(),
                                  // Container(
                                  //   alignment: Alignment.center,
                                  //   child: Image.network(
                                  //     // 'assets/images/tool2.jpg',
                                  //     'https://itp1.itopfile.com/ImageServer/4126d2c0cf8328a2/0/0/terumoLM835z-z834018553741.webp', // เปลี่ยนเป็น URL ของรูปภาพที่ต้องการแสดง
                                  //     // productlist.listproduct[0].imageUrl,
                                  //     width: MediaQuery.of(context).size.width *
                                  //         0.8, // ปรับความกว้างของรูปภาพ
                                  //     fit: BoxFit.contain,
                                  //   ),
                                  // ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/tool2.JPG', // เปลี่ยนเป็นที่อยู่ของรูปภาพใน assets ของคุณ
                                      width: MediaQuery.of(context).size.width *
                                          0.8, // ปรับความกว้างของรูปภาพ
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  Divider(),
                                  InfoRow(
                                    title: 'ครุภัณฑ์:',
                                    value: productlist.listproduct[0].mdcCd
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
                                    title: 'อุปกรณ์:',
                                    value: productlist
                                        .listproduct[0].mdcEquipment
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'หมายเลขเครื่อง:',
                                    value: productlist.listproduct[0].mdcDoc
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'รุ่น:',
                                    value: productlist.listproduct[0].mdcRun
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
                                    title: 'แผนก:',
                                    value: productlist.listproduct[0].mdcDep
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
                                    title: 'ราคาที่ซื้อ:',
                                    value: productlist.listproduct[0].mdcPrice
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),
                                  InfoRow(
                                    title: 'สถานภาพสินทรัพย์:',
                                    value: productlist.listproduct[0].mdcStsName
                                        .toString(),
                                    // isCentered: true,
                                  ),
                                  Divider(),

                                  SizedBox(
                                    height: 30,
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
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget>[
          // ปุ่มแรก
          Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BorrowMedicalTool(), // หน้าปลายทางที่คุณต้องการเด้งไป
                  ),
                );
              },
              tooltip: 'ยืม',
              child: Icon(Icons.assignment),
            ),
          ),
          // ปุ่มที่สอง
          Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ReturnMedicalTool(), // หน้าปลายทางที่คุณต้องการเด้งไป
                  ),
                );
              },
              tooltip: 'คืน',
              child: Icon(Icons.content_paste_go),
            ),
          ),
          // สามารถเพิ่มปุ่มอื่น ๆ เพิ่มเติมได้ตามต้องการ
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData:
            AnimatedIcons.menu_close, // เปลี่ยนเป็นไอคอนที่คุณต้องการ
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
