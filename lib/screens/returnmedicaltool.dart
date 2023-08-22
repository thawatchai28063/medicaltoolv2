import 'package:flutter/material.dart';
// import 'package:flutter_dropdown_alert/alert_controller.dart';
// import 'package:flutter_dropdown_alert/dropdown_alert.dart';
// import 'package:flutter_dropdown_alert/model/data_alert.dart';

class ReturnMedicalTool extends StatefulWidget {
  const ReturnMedicalTool({super.key});

  @override
  State<ReturnMedicalTool> createState() => _ReturnMedicalToolState();
}

class _ReturnMedicalToolState extends State<ReturnMedicalTool> {
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คืนเครื่องมือแพทย์'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        // Wrap the entire content with ListView
        padding: EdgeInsets.all(10),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 209, 207, 202),
              border: Border.all(width: 1.2, color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ชื่อเครื่องมือ:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "แผนก:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "หมายเลขเครื่อง:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "รุ่น:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "ผู้ผลิต:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "ครุภัณฑ์:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "เหตุผลในการยืม:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Text(
                            "เจ้าหน้าที่แผนก:",
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
                          Text(
                            "ชื่อผู้รับเครื่อง",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(),
                          Text(
                            "ชื่อผู้ส่งเครื่อง",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(),
                          Text(
                            'Selected Date and Time: ${_selectedDateTime.toLocal()}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  child: Text('Select Date'),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () => _selectTime(context),
                                  child: Text('Select Time'),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
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
                              child: Text(
                                "บันทึกการยืม",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                              onPressed: () {},
                            ),
                          )
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
}
