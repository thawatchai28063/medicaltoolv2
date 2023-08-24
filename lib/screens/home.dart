import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicaltoolv2/controller/detail_productcon.dart';

import 'borrowmedicaltool.dart';
import 'detail_pagev2.dart';
import 'returnmedicaltool.dart';
import 'side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? result = '';
  String val_search = '';
  final productlist = Get.put(product_controller());
  TextEditingController text_find = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
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
              'M E D I C A L T O O L',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 180,
              height: 140,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 94, 93, 94),
                borderRadius: BorderRadius.circular(10), // ขอบมน
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // ขอบมน
                child: Image.asset(
                  'assets/images/termomiter1.JPG',
                  width: 180,
                  height: 140,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BorrowMedicalTool()),
                      );
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 94, 93, 94),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.rotate_right,
                            color: Colors.yellow,
                            size: 48,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "ยืมเครื่องมือแพทย์",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReturnMedicalTool()),
                      );
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 94, 93, 94),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.content_paste_go,
                            color: Colors.yellow,
                            size: 48,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "คืนเครื่องมือแพทย์",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detailv2()),
                );
              },
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.all(10), // ระยะห่างรอบๆ Container
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 94, 93, 94),
                  borderRadius: BorderRadius.circular(10), // ขอบมน
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.content_paste_search,
                      color: Colors.yellow,
                      size: 48,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "ข้อมูลอุปกรณ์",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   ));
// }

