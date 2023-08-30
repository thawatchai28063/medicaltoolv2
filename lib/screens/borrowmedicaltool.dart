import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicaltoolv2/utility/api_domain.dart';
import 'package:quickalert/quickalert.dart';

import 'home.dart';

class BorrowMedicalTool extends StatefulWidget {
  const BorrowMedicalTool({super.key});

  @override
  State<BorrowMedicalTool> createState() => _BorrowMedicalToolState();
}

class _BorrowMedicalToolState extends State<BorrowMedicalTool> {
  final formkey = GlobalKey<FormState>();

  TextEditingController mdc_name = TextEditingController();
  TextEditingController mdc_dep = TextEditingController();
  TextEditingController mdc_cd = TextEditingController();
  TextEditingController mdc_run = TextEditingController();
  TextEditingController mdc_producer = TextEditingController();
  TextEditingController mdc_durable_articles = TextEditingController();
  TextEditingController mdc_reason = TextEditingController();
  TextEditingController mdc_sendem_name = TextEditingController();
  TextEditingController mdc_sendem_cd = TextEditingController();
  TextEditingController mdc_receiveem_name = TextEditingController();
  TextEditingController mdc_receiveem_cd = TextEditingController();
  TextEditingController mdc_now = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDateTime) {
      setState(() {
        _selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          _selectedDateTime.hour,
          _selectedDateTime.minute,
        );
        mdc_now.text = _selectedDateTime.toLocal().toString().substring(0, 16);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        mdc_now.text = _selectedDateTime.toLocal().toString().substring(0, 16);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ยืมเครื่องมือแพทย์'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        // Wrap the entire content with ListView
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 207, 202),
              border: Border.all(width: 1.2, color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ชื่อเครื่องมือ:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'กรุณากรอกชื่อเครื่องมือ',
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      controller: mdc_name,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อเครื่องมือ';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "แผนก:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'กรุณากรอกชื่อแผนก',
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      controller: mdc_dep,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อแผนก';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "หมายเลขเครื่อง:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'กรุณากรอกหมายเลขเครื่อง',
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      controller: mdc_cd,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกหมายเลขเครื่อง';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "รุ่น:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'กรุณากรอกรุ่น',
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      controller: mdc_run,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อรุ่น';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "ผู้ผลิต:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'กรุณากรอกชื่อผู้ผลิต',
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      controller: mdc_producer,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อผู้ผลิต';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "ครุภัณฑ์:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'กรุณากรอกครุภัณฑ์',
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      controller: mdc_durable_articles,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกครุภัณฑ์';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "เหตุผลในการยืม:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'กรุณากรอกเหตุผลในการยืม',
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      controller: mdc_reason,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกเหตุผลในการยืม';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Text(
                            "เจ้าหน้าที่เครื่องมือแพทย์:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ชื่อผู้ส่ง",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'กรุณากรอกชื่อผู้ส่ง',
                              contentPadding: const EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            controller: mdc_sendem_name,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกชื่อผู้ส่ง';
                              }
                              return null;
                            }),
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                          ),
                          const Text(
                            "รหัสผู้ส่ง",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'กรุณากรอกรหัสผู้ส่ง',
                              contentPadding: const EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            controller: mdc_sendem_cd,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกรหัสผู้ส่ง';
                              }
                              return null;
                            }),
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                          ),
                          const Text(
                            "ชื่อผู้รับ",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'กรุณากรอกชื่อผู้รับ',
                              contentPadding: const EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            controller: mdc_receiveem_name,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกชื่อผู้รับ';
                              }
                              return null;
                            }),
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                          ),
                          const Text(
                            "รหัสผู้รับ",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'กรุณากรอกรหัสผู้รับ',
                              contentPadding: const EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            controller: mdc_receiveem_cd,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกรหัสผู้รับ';
                              }
                              return null;
                            }),
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                          ),
                          Text(
                            'Selected Date and Time: ${mdc_now.text ?? "No date and time selected"}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  child: const Text('Select Date'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () => _selectTime(context),
                                  child: const Text('Select Time'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              child: ElevatedButton(
                            child: const Text(
                              "บันทึกการยืม",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 252, 0, 0),
                              ),
                            ),
                            onPressed: () async {
                              Future<String?> success = insert();
                              print('success$success');
                              setState(() {});
                            },
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> insert() async {
    Map<String, String> queryParam = {
      'mdc_name': mdc_name.text,
      'mdc_dep': mdc_dep.text,
      'mdc_cd': mdc_cd.text,
      'mdc_run': mdc_run.text,
      'mdc_producer': mdc_producer.text,
      'mdc_durable_articles': mdc_durable_articles.text,
      'mdc_reason': mdc_reason.text,
      'mdc_sendem_name': mdc_sendem_name.text,
      'mdc_sendem_cd': mdc_sendem_cd.text,
      'mdc_receiveem_name': mdc_receiveem_name.text,
      'mdc_receiveem_cd': mdc_receiveem_cd.text,
      'mdc_now': _selectedDateTime.toLocal().toString().substring(0, 16),
    };

    var respon = await http.get(
      Uri.https(apidomain, apiinsertproduct, queryParam),
    );
    // print('response=$apidomain$apiinsertproduct$queryParam');
    if (respon.statusCode == 200) {
      var jsonString = respon.body.toString().trim();
      //print(jsonString);
      if (jsonString == "OK") {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'บันทึกสำเร็จ',
            confirmBtnText: 'ถัดไป',
            onConfirmBtnTap: () async {
              Get.toNamed('/detail');
            });
      }
    }
  }
}
