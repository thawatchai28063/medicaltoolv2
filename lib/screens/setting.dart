import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SetTingPage extends StatefulWidget {
  const SetTingPage({super.key});

  @override
  State<SetTingPage> createState() => _SetTingPageState();
}

class _SetTingPageState extends State<SetTingPage> {
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
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'ตั้ ง ค่ า',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  0.8, // กำหนดความกว้างสูงสุดของ Container ให้เท่ากับความกว้างของหน้าจอ
              maxHeight: MediaQuery.of(context)
                  .size
                  .height, // กำหนดความสูงสูงสุดของ Container ให้เท่ากับความสูงของหน้าจอ
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/setting.JPG"),
                fit: BoxFit.contain, // เลือก BoxFit ที่เหมาะสมกับการแสดงรูปภาพ
              ),
            ),
          ),
        ));
  }
}
