import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_node_store/components/image_not_found.dart';
import 'package:flutter_node_store/models/bill_model.dart';
import 'package:flutter_node_store/screens/bills/components/bill_form.dart';
import 'package:flutter_node_store/services/rest_api.dart';
import 'package:flutter_node_store/utils/constants.dart';
import 'package:flutter_node_store/utils/utility.dart';
import '../buttomnavpage/income_screen.dart';

class BillUpdate extends StatefulWidget {
  const BillUpdate({super.key});

  @override
  State<BillUpdate> createState() => _BillUpdateState();
}

class _BillUpdateState extends State<BillUpdate> {
  
  // สร้าง GlobalKey สำหรับฟอร์ม
  final _formKeyUpdateBill = GlobalKey<FormState>();

  //สร้างตัวแปรสำหรับเก็บข้อมูล Bill
  final _bill = BillModel(
    billId: 0,
    customerName: '',
    customerPhone: '0000000000',
    customerGender: '',
    promotion: 'Rezet 1 ซอง',
    buyAmount: 1,
    price: 395,
    adress: '555/39',
    provence: 'กรุงเทพมหานคร',
    postId: '10510',
    payment: 'COD',
    logisticStatus: 'ยังไม่ส่ง',
    cashInDate: '27/01/2024',
    platform: '',
    salesId: '000000',
    purchaseAt: '',
  );

  // ไฟล์รูปภาพ
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    // รับค่า arguments ที่ส่งมาจากหน้าก่อนหน้า
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    
    Utility().logger.d(arguments);

    // set ค่าเริ่มต้นให้กับ Model
    _bill.billId = arguments['bills']['bill_id'];
    _bill.customerName = arguments['bills']['customer_name'];
    _bill.customerPhone = arguments['bills']['customer_phone'];
    _bill.customerGender = arguments['bills']['customer_gender'];
    _bill.promotion = arguments['bills']['promotion'];
    _bill.buyAmount = arguments['bills']['buy_amount'];
    _bill.price = arguments['bills']['price'];
    _bill.adress = arguments['bills']['adress'];
    _bill.provence = arguments['bills']['provence'];
    _bill.postId = arguments['bills']['post_id'];
    _bill.payment = arguments['bills']['payment'];
    _bill.logisticStatus = arguments['bills']['logistic_status'];
    _bill.cashInDate = arguments['bills']['cash_in_date'];
    _bill.platform = arguments['bills']['platform'];
    _bill.salesId = arguments['bills']['sales_id'];
    _bill.purchaseAt = arguments['bills']['purchase_at'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Update'),
        actions: [
          // Save Button
          IconButton(
            onPressed: () async {
              if (_formKeyUpdateBill.currentState!.validate()) {
                _formKeyUpdateBill.currentState!.save();
                // Utility().logger.d(_bill.toJson());
                // Utility().logger.d(_imageFile);

                // Call API Update Bill
                var response =
                    await CallAPI().updateBillAPI(_bill, imageFile: _imageFile);

                var body = jsonDecode(response);

                if (body['status'] == 'ok') {
                  if (!mounted)
                    return; // กรณีที่ออกจากหน้าจอแล้ว ไม่ต้องทำอะไรต่อ
                  // ปิดหน้าจอและส่งค่ากลับไปยังหน้าก่อนหน้า
                 
                  Navigator.pop(context, true);

                  // อัพเดทข้อมูลใหม่ล่าสุด
                  refreshKey.currentState!.show();
                }
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 600,
            child: arguments['bills']['image_bill'] != null &&
                    arguments['bills']['image_bill'].isNotEmpty
                ? _image(arguments['bills']['image_bill'])
                : const ImageNotFound(),
          ),
          BillForm(_bill,
              callBackSetImage: _callBackSetImage,
               formKey: _formKeyUpdateBill),
        ],
      )),
    );
  }

  //_image Widget
  Container _image(String image) {
    String imageUrl;
    if (image.contains('://')) {
      imageUrl = image;
    } else {
      imageUrl = '$baseURLImage$image';
    }
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            )));
  }

  // ฟังก์ชันสำหรับเลือกรูปภาพ
  void _callBackSetImage(File? imageFile) {
    setState(() {
      _imageFile = imageFile;
    });
  }
}
