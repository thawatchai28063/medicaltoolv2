import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/MdcModel.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Future<List<MdcModel>> fetchData() async {
    var url = Uri.parse('http://192.168.0.5/apimdc/api_getproduct -2.php');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => MdcModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 231, 215),
      appBar: AppBar(
        title: Text('ข้อมูลอุปกรณ์'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<MdcModel>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 150,
                        height: 120,
                        child: Image.asset("assets/images/Logo3.png"),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '   รหัสสินทรัพย์ : ' +
                            snapshot.data![index].mdcCd.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        child: Text(
                          '  ชื่อเครื่องมือ : ' +
                              snapshot.data![index].mdcName.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  Invoice No. : ' +
                            snapshot.data![index].mdcInvoiceNo.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  Equipmemt : ' +
                            snapshot.data![index].mdcEquipment.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  หน่วยนับ :',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  หมายเลขเครื่อง : ' +
                            snapshot.data![index].mdcId.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  รุ่น : ' + snapshot.data![index].mdcRun.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  ยี่ห้อ : ' +
                            snapshot.data![index].mdcYeeho.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  หน่วยงาน : ' +
                            snapshot.data![index].mdcDep.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  อาคาร : ' + snapshot.data![index].mdcUbr.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '  สถารที่ตั้ง : ' +
                            snapshot.data![index].mdcLocation.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: DetailPage(),
//   ));
// }
