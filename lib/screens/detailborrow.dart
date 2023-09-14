import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:medicaltoolv2/remote_service/remote_server.dart';

import '../controller/dep_controller.dart';
import '../controller/get_borrow.dart';
import '../model/model_dep.dart';

class DetailBorrow extends StatefulWidget {
  DetailBorrow({Key? key});

  @override
  State<DetailBorrow> createState() => _DetailBorrowState();
}

// final List<MultiLevelString> myItems = [
//   MultiLevelString(level1: "แผนกอายุรกรรม"),
//   MultiLevelString(level1: "แผนกศัลยกรรม"),
//   MultiLevelString(level1: "แผนกสูตินรีเวช"),
//   // เพิ่มแผนกอื่น ๆ ตามที่คุณต้องการ
// ];

class _DetailBorrowState extends State<DetailBorrow> {
  String? selectedDepartment;
  List<Widget> selectedCards = [];
  final deplist = Get.put(dep_controller());
  final getborrowlist = Get.put(getborrow_controller());
  List<ModelDep> myItems = [];

  @override
  void initState() {
    // TODO: implement initState
    getdeplist('ALL');
    super.initState();
    setState(() {});
  }

  void getdeplist(String SN) async {
    deplist.fectdep('ALL'); // await RemoteService.fectgetdep(SN);

    var healthcarevalue = 'เลือกแผนก';
    print('TEST-object');
    // print(deplist.listdep);

    myItems = deplist.listdep;

    print('myitem=${myItems}');
  }

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
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'ข้อมูลการยืมอุปกรณ์',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownSearch<String>(
                items: myItems.map((item) => item.depname.toString()).toList(),
                onChanged: (selected) {
                  getborrowlist.listborrow.clear();
                  setState(() {
                    getborrowlist.fectgetborrow(selected!);
                    print('getborrowlist=>${getborrowlist.listborrow.length}');
                    // selectedDepartment = selected;
                    // selectedCards.clear();
                    // if (selectedDepartment != null) {
                    //   selectedCards = _buildSelectedCards(selectedDepartment!);
                    // }
                  });
                },
                selectedItem: selectedDepartment,
                dropdownBuilder: (context, selectedItem) {
                  return Text(
                    selectedItem ?? 'เลือกแผนก',
                    style: TextStyle(fontSize: 18),
                  );
                },
              ),
            ),
            // if (selectedDepartment != null) ...selectedCards,
            Obx(() => getborrowlist.listborrow.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: getborrowlist.listborrow.length,
                    itemBuilder: (context, index) => showdetail(index),
                  )
                : Center(
                    child: Text('Nodata'),
                  )),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSelectedCards(String selectedData) {
    // สร้าง Cards จากข้อมูลที่เลือกแผนก
    return List.generate(3, (index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/tool2.JPG',
                width: 80,
                height: 80,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'รายละเอียด:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ข้อมูลการ์ดที่ $index',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'สำหรับแผนก:$selectedData',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget showdetail(int index) {
    var getshow = getborrowlist.listborrow[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/tool2.JPG',
              width: 80,
              height: 80,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'รายละเอียด:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SN= ${getshow.mdcCd}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'อยู่ที่ : ${getshow.mdcDep} ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
