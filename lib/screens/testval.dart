import 'package:flutter/material.dart';

class testval extends StatefulWidget {
  const testval({super.key});

  @override
  State<testval> createState() => _testvalState();
}

class _testvalState extends State<testval> {
  String val_search = ''; // Initialize val_search

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFormField Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'กรุณากรอกข้อมูล',
                  hintText: 'กรอกข้อมูล',
                  contentPadding: EdgeInsets.all(20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    val_search = value;
                  });
                },
              ),
              height: 100,
            ),
            SizedBox(height: 20),
            Text('Value: $val_search'),
          ],
        ),
      ),
    );
  }
}
