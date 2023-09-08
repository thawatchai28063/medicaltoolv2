import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

final List<MultiLevelString> myItems = [
  MultiLevelString(level1: "แผนกอายุรกรรม"),
  MultiLevelString(level1: "แผนกศัลยกรรม"),
  MultiLevelString(level1: "แผนกสูตินรีเวช"),
  // เพิ่มแผนกอื่น ๆ ตามที่คุณต้องการ
];

class _DropdownState extends State<Dropdown> {
  String? selectedDepartment;
  List<Widget> selectedCards = [];

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
                items: myItems.map((item) => item.level1).toList(),
                onChanged: (selected) {
                  setState(() {
                    selectedDepartment = selected;
                    selectedCards.clear();
                    if (selectedDepartment != null) {
                      selectedCards = _buildSelectedCards(selectedDepartment!);
                    }
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
            if (selectedDepartment != null) ...selectedCards,
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSelectedCards(String selectedData) {
    // สร้าง Cards จากข้อมูลที่เลือกแผนก
    return List.generate(10, (index) {
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
                    // SizedBox(height: 5),
                    Text(
                      'ข้อมูลการ์ดที่ $index',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'สำหรับแผนก:$selectedData',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(
                        //   selectedData,
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                    // คุณสามารถแสดงข้อมูลอื่น ๆ ที่คุณต้องการในการ์ดนี้ได้ที่นี่
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MultiLevelString {
  final String level1;

  MultiLevelString({
    this.level1 = "",
  });

  @override
  String toString() => level1;
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Dropdown(),
    ),
  ));
}
