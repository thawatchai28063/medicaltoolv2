import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/detail_productcon.dart';
import '../model/MdcModel.dart';
import '../utility/api_domain.dart';

class Product_detail extends StatefulWidget {
  Product_detail({super.key});

  @override
  State<Product_detail> createState() => _Product_detailState();
}

class _Product_detailState extends State<Product_detail> {
  String val_search = '';
  String val_barcode = '';
  List<MdcModel> productmodel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productmodel.clear();
    getproductname('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: TextField(
              onChanged: (val) {
                setState(() {
                  productmodel.clear();
                  val_search = val;
                  getproductname(val_search);
                });
              },
            ),
            width: 300,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productmodel.length,
              itemBuilder: (context, index) => showproduct(index),
            ),
          ),
        ],
      ),
    );
  }

  showproduct(int index) {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: 25,
      ),
      title: Text(
        '${productmodel[index].mdcEquipment}',
        style: TextStyle(fontSize: 20),
      ),
      // onTap: () {logout();},
      onTap: () {},
    );
  }

  Future<void> getproductname(String val) async {
    Map<String, String> queryParam = {
      'SN': val,
    };
    MdcModel mdeproduct;
    productmodel.clear();
    var Client = http.Client();
    var respon = await Client.get(
      Uri.http(apidomain, apiGetproduct, queryParam),
    );
    print(apidomain + apiGetproduct);
    if (respon.statusCode == 200) {
      var result = jsonDecode(respon.body);
      print(result);

      for (var map in result) {
        mdeproduct = MdcModel.fromJson(map);
        setState(() {
          productmodel.add(mdeproduct);
        });
      }
    }
  }
}
