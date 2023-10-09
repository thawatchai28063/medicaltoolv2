import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicaltoolv2/remote_service/remote_server.dart';
import 'package:get_storage/get_storage.dart';
import '../model/MdcModel.dart';

final storage = GetStorage();

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? SN = Get.parameters['SN'] ?? '';

  // final listborrow = Get.put(getborrow_controller());
  TextEditingController text_find = TextEditingController();
  @override
  void initState() {
    super.initState();

    getdata(SN!);
  }

  //
  List<MdcModel>? detailList = [];
  String? mdcCd = '';
  Future<void> getdata(String SN) async {
    detailList = await RemoteService.fectmdcid(SN);

    print('OK=${SN}');
    print('api=${detailList![0].mdcCd ?? ''}');
    mdcCd = detailList![0].mdcCd ?? '';
    setState(() {});
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
                  Text('ข้อมูลอุปกรณ์', style: TextStyle(fontSize: 24)),
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
                    title: 'หมายเลขครุภัณฑ์:',
                    value:
                        detailList!.isEmpty ? '' : detailList![0].mdcCd ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'ชื่ออุปกรณ์:',
                    value:
                        detailList!.isEmpty ? '' : detailList![0].mdcName ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'แผนก:',
                    value:
                        detailList!.isEmpty ? '' : detailList![0].mdcDep ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'หมายเลขเครื่อง:',
                    value:
                        detailList!.isEmpty ? '' : detailList![0].mdcDoc ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'รุ่น:',
                    value:
                        detailList!.isEmpty ? '' : detailList![0].mdcRun ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'ยี่ฮ้อ:',
                    value: detailList!.isEmpty
                        ? ''
                        : detailList![0].mdcYeeho ?? '',
                    // isCentered: true,
                  ),
                  // Divider(),
                  // InfoRow(
                  //   title: 'แผนก:',
                  //   value: storage.read('mdcDep') ?? '',
                  //   // isCentered: true,
                  // ),
                  Divider(),
                  InfoRow(
                    title: 'อาคาร:',
                    value:
                        detailList!.isEmpty ? '' : detailList![0].mdcUbr ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'พื้นที่:',
                    value: detailList!.isEmpty
                        ? ''
                        : detailList![0].mdcLocation ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'ราคาที่ซื้อ:',
                    value: detailList!.isEmpty
                        ? ''
                        : detailList![0].mdcPrice ?? '',
                    // isCentered: true,
                  ),
                  Divider(),
                  InfoRow(
                    title: 'สถานะ:',
                    value: 'กำลังยืม' ?? '',
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
