import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicaltoolv2/screens/detail_page.dart';
import 'package:medicaltoolv2/screens/product_detail.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/borrowmedicaltool.dart';
import 'screens/detail_pagev2.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/returnmedicaltool.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final storage = GetStorage();
  List<GetPage> getpageList = [
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/BorrowMedical',
      page: () => BorrowMedicalTool(),
    ),
    GetPage(
      name: '/ReturnMedicalTool',
      page: () => ReturnMedicalTool(),
    ),
    GetPage(
      name: '/detailpage',
      page: () => DetailPage(),
    ),
    GetPage(
      name: '/productdetail',
      page: () => Product_detail(),
    ),
    GetPage(
      name: '/detail',
      page: () => Detailv2(),
    ),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String initialPage = '/detail';
    return GetMaterialApp(
      title: 'Medicaltool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // สีหลัก
          backgroundColor:
              Color.fromARGB(255, 129, 143, 153), // สีพื้นหลังที่คุณต้องการ
        ),
      ),
      // getPages: getpageList,
      // initialRoute: initialPage,
      getPages: getpageList,
      initialRoute: initialPage,
    );
  }
}
