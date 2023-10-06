import 'package:flutter/material.dart';
import 'package:medicaltoolv2/screens/setting.dart';
import 'package:get_storage/get_storage.dart';
import 'borrowmedicaltool.dart';
import 'detail_pagev2.dart';
import 'login.dart';
import 'returnmedicaltool.dart';

final storage = GetStorage();

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  TextEditingController text_user = TextEditingController();
  TextEditingController text_emcd = TextEditingController();
  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    text_user.text = storage.read('user') ?? '';
    text_emcd.text = storage.read('em_cd') ?? '';
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 161, 155, 157),
      child: ListView(
        children: [
          Container(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.asset(
                  "assets/images/Logo3.png", // ตำแหน่งของรูปภาพในทรัพยากร
                  fit: BoxFit.cover,
                ),
                backgroundColor: Colors.transparent, // เปลี่ยนเป็นสีโปร่งใส
              ),
              accountName: Container(
                child: Text(
                  '${storage.read('user') ?? ''}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              accountEmail: Container(
                // color: Colors.white, // กำหนดสีพื้นหลังเป็นสีขาว
                child: Text(
                  'รหัสพนักงาน  ${storage.read('em_cd') ?? ''}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/img11.jpg", // ตำแหน่งของรูปภาพในทรัพยากร
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.assignment,
              size: 40,
              color: const Color.fromARGB(255, 0, 64, 116),
            ),
            title: Text(
              'ยืมเครื่องมือแพทย์',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BorrowMedicalTool()));
            },
          ),
          // Divider(),
          ListTile(
            leading: Icon(
              Icons.content_paste_go,
              size: 40,
              color: Colors.purple,
            ),
            title: Text(
              'คืนเครื่องมือแพทย์',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ReturnMedicalTool()));
            },
          ),
          // Divider(),
          ListTile(
            leading: Icon(
              Icons.content_paste_search,
              size: 40,
              color: Colors.blueAccent,
            ),
            title: Text(
              'ข้อมูลอุปกรณ์',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Detailv2()));
            },
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     size: 25,
          //   ),
          //   title: Text(
          //     'ตั้งค่า',
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   onTap: () {
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (context) => SetTingPage()));
          //   },
          // ),
          SizedBox(
            height: 40,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 40,
              color: Colors.red,
            ),
            title: Text(
              'ออกจากระบบ',
              style: TextStyle(fontSize: 20),
            ),
            // onTap: () {logout();},
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
