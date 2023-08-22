import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? result = '';

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
        actions: [
          Row(
            children: [
              // IconButton(
              //   onPressed: () {
              //     // getPharinfo('8904093808111', 'IPD');
              //   },
              //   icon: const Icon(Icons.abc),
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: const Icon(
                    Icons.qr_code,
                    size: 40,
                    color: Colors.amberAccent,
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
                        // productlist.fectfindproduct(res);
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
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  child: Row(
                    children: [
                      Icon(Icons.qr_code), // Add your icon here
                      SizedBox(
                          width: 8), // Add some space between the icon and text
                      Text(
                        "Scanned QR Code",
                        style: TextStyle(fontSize: 20, color: Colors.black),
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
                        result = res;
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Data Scan ',
                          text: result,
                          confirmBtnText: 'OK',
                        );
                      }
                    });
                  },
                ),
              ),
              Center(
                child: Text(
                  'SacanResult: $result',
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
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
