import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('L O G I N P A G E'),
      //   backgroundColor: Colors.blue,
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://a-static.besthdwallpaper.com/3d-colorful-apple-logo-wallpaper-2048x1152-109015_49.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 350,
                width: 150,
                // child: Image.network(
                //   'https://www.squat.in.th/wp-content/uploads/2021/05/Doctor-Online-02.jpg',
                //   width: 150,
                //   height: 150,
                //   fit: BoxFit.cover,
                // ),
                child: Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_dn6rwtwl.json',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  border: Border.all(width: 1.2, color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'ID',
                    hintText: 'กรุณากรอก ID',
                    contentPadding: EdgeInsets.all(20.0),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอก ID';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  border: Border.all(width: 1.2, color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'กรุณากรอกรหัสผ่าน',
                    contentPadding: EdgeInsets.all(20.0),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอกรหัสผ่าน';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 20,
                height: 50,
                child: MaterialButton(
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(fontSize: 25),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.toNamed('/');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
