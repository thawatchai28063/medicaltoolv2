// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Department {
//   final String name;
//   final String apiUrl;

//   Department(this.name, this.apiUrl);
// }

// class Device {
//   final String name;
//   final String code;
//   final String department;
//   final String imageUrl;

//   Device(this.name, this.code, this.department, this.imageUrl);
// }

// List<Department> departments = [
//   Department('แผนกอายุรกรรม', 'URL_API_แผนก_1'),
//   Department('แผนกศัลยกรรม', 'URL_API_แผนก_2'),
//   // เพิ่มแผนก
// ];

// class YourDropdownPage extends StatefulWidget {
//   @override
//   _YourDropdownPageState createState() => _YourDropdownPageState();
// }

// class _YourDropdownPageState extends State<YourDropdownPage> {
//   Department? selectedDepartment;
//   List<Device> devices = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Card จาก API'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             DropdownButton2<Department>(
//               hint: Text(
//                 'กรุณาเลือกแผนก',
//                 style: TextStyle(fontSize: 15, color: Colors.red),
//               ), // เพิ่มบรรทัดนี้
//               items: departments
//                   .map((department) => DropdownMenuItem<Department>(
//                         value: department,
//                         child: Text(department.name),
//                       ))
//                   .toList(),
//               value: selectedDepartment,
//               onChanged: (department) async {
//                 setState(() {
//                   selectedDepartment = department;
//                 });
//                 if (selectedDepartment != null) {
//                   try {
//                     final fetchedDevices =
//                         await fetchDevices(selectedDepartment!.apiUrl);
//                     setState(() {
//                       devices = fetchedDevices;
//                     });
//                   } catch (e) {
//                     print('เกิดข้อผิดพลาดในการดึงข้อมูล: $e');
//                   }
//                 }
//               },
//             ),
//             SizedBox(height: 20.0),
//             if (devices.isNotEmpty)
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: devices.length,
//                   itemBuilder: (context, index) {
//                     final device = devices[index];
//                     return Card(
//                       child: Column(
//                         children: [
//                           Image.network(device.imageUrl),
//                           ListTile(
//                             title: Text(device.name),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('รหัสทรัพสินค้า: ${device.code}'),
//                                 Text('แผนก: ${device.department}'),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               )
//             else if (selectedDepartment != null)
//               Text('ไม่พบข้อมูลอุปกรณ์สำหรับแผนกนี้')
//             else
//               Text('กรุณาเลือกแผนก'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<List<Device>> fetchDevices(String apiUrl) async {
//   final response = await http.get(Uri.parse(apiUrl));
//   if (response.statusCode == 200) {
//     final List<dynamic> jsonData = json.decode(response.body);
//     return jsonData
//         .map((item) => Device(
//               item['name'],
//               item['code'],
//               item['department'],
//               item['imageUrl'],
//             ))
//         .toList();
//   } else {
//     throw Exception('ไม่สามารถดึงข้อมูลได้');
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: YourDropdownPage(),
//   ));
// }
