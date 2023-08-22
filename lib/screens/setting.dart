import 'package:flutter/foundation.dart';
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
              'S E T T I N G',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.center, // กำหนดให้เป็นการจัดตำแหน่งกึ่งกลาง
        child: Container(
          width: 250, // กำหนดความกว้างของ Container
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i0.wp.com/www.forest.go.th/khonkaen7/wp-content/uploads/sites/43/2022/02/maintence.png?ssl=1'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
