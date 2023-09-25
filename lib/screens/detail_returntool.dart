import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/get_borrow.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/get_return.dart';

final storage = GetStorage();

class DetailRPage extends StatefulWidget {
  const DetailRPage({super.key});

  @override
  State<DetailRPage> createState() => _DetailRPageState();
}

class _DetailRPageState extends State<DetailRPage> {
  String val_search = '';

  final listreturn = Get.put(getreturn_controller());
  TextEditingController text_find = TextEditingController();
  @override
  void initState() {
    super.initState();
    getdata();
  }

  final formkey = GlobalKey<FormState>();
  TextEditingController mdc_name = TextEditingController();
  TextEditingController mdc_dep = TextEditingController();
  TextEditingController mdc_id = TextEditingController();
  TextEditingController mdc_run = TextEditingController();
  TextEditingController mdc_yeeho = TextEditingController();
  TextEditingController mdc_cd = TextEditingController();
  TextEditingController mdc_reason = TextEditingController();
  TextEditingController mdc_sendem_name = TextEditingController();
  TextEditingController mdc_sendem_cd = TextEditingController();
  TextEditingController mdc_receiveem_name = TextEditingController();
  TextEditingController mdc_receiveem_cd = TextEditingController();
  TextEditingController mdc_now = TextEditingController();
  TextEditingController mdc_date_return = TextEditingController();

  TextEditingController mdcLocation = TextEditingController();

  TextEditingController mdcCostlast = TextEditingController();

  TextEditingController mdcStsName = TextEditingController();

  TextEditingController mdcPrice = TextEditingController();

  TextEditingController mdcUbr = TextEditingController();

  Future<void> getdata() async {
    mdc_name.text = storage.read('mdcName') ?? '';
    //mdc_name.text = 'TEst';
    print('mdc_name$mdc_name');
    mdc_dep.text = storage.read('mdcDep') ?? '';
    mdc_id.text = storage.read('mdcDoc') ?? '';
    mdc_run.text = storage.read('mdcRun') ?? '';
    mdc_yeeho.text = storage.read('mdcYeeho') ?? '';
    mdc_cd.text = storage.read('mdcCd') ?? '';
    mdc_sendem_name.text = storage.read('mdcCd') ?? '';
    mdc_sendem_cd.text = storage.read('mdcCd') ?? '';
    mdcLocation.text = storage.read('mdcLocation') ?? '';
    mdcCostlast.text = storage.read('mdcCostlast') ?? '';
    mdcStsName.text = storage.read('mdcStsName') ?? '';
    mdcPrice.text = storage.read('mdcPrice') ?? '';

    mdcUbr.text = storage.read('mdcUbr') ?? '';
  }

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
                  Text('ข้อมูลการคืน', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Divider(),
                  InfoRow(
                    title: 'รูปภาพ:',
                    value:
                        '', // ไม่ต้องใส่ข้อมูลที่ value เนื่องจากจะแสดงภาพที่แทนที่ได้
                  ),
                  Divider(),
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
                    value: storage.read('mdcCd') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'ชื่ออุปกรณ์:',
                    value: storage.read('mdcName') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'หมายเลขเครื่อง:',
                    value: storage.read('mdcDep') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'หมายเลขเครื่อง:',
                    value: storage.read('mdcDoc') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'รุ่น:',
                    value: storage.read('mdcRun') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'ยี่ฮ้อ:',
                    value: storage.read('mdcYeeho') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'แผนก:',
                    value: storage.read('mdcDep') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'อาคาร:',
                    value: storage.read('mdcUbr') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'พื้นที่:',
                    value: storage.read('mdcLocation') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'ราคาที่ซื้อ:',
                    value: storage.read('mdcPrice') ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'สถานภาพสินทรัพย์:',
                    value: storage.read('mdcStsName') ?? '',
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
