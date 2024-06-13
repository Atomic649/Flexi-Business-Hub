import 'dart:convert';
import 'dart:io';
import 'package:flexi_business_hub/components/image_not_found.dart';
import 'package:flexi_business_hub/models/bill_model.dart';
import 'package:flexi_business_hub/screens/bills/components/bill_form.dart';
import 'package:flexi_business_hub/services/API/rest_api_bill.dart';
import 'package:flexi_business_hub/utils/constants.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';
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
  cName: '',
    cLastname: '',
    cPhone: '',
    cGender: '',
    cAdress: '',
    cProvince: '',
    cPostId: '',
    product: '',
    payment: '',
    amount: 0,
    platform: '',
    cashStatus: true,
    price: 0,    
    memberId: '',
  );
  // ไฟล์รูปภาพ
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    // รับค่า arguments ที่ส่งมาจากหน้าก่อนหน้า
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    
    Utility().logger.d(arguments);

    // set ค่าเริ่มต้นให้กับ Model
    _bill.cName = arguments['bill']['cName'];
    _bill.cLastname = arguments['bill']['cLastname'];
    _bill.cPhone = arguments['bill']['cPhone'];
    _bill.cGender = arguments['bill']['cGender'];
    _bill.cAdress = arguments['bill']['cAdress'];
    _bill.cProvince = arguments['bill']['cProvince'];
    _bill.cPostId = arguments['bill']['cPostId'];
    _bill.product = arguments['bill']['product'];
    _bill.payment = arguments['bill']['payment'];
    _bill.amount = arguments['bill']['amount'];
    _bill.platform = arguments['bill']['platform'];
    _bill.cashStatus = arguments['bill']['cashStatus'];
    _bill.price = arguments['bill']['price'];
    _bill.memberId = arguments['bill']['memberId'];
   
    
   

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
            child: arguments['bill']['imageBill'] != null &&
                    arguments['bill']['imageBill'].isNotEmpty
                ? _image(arguments['bill']['imageBill'])
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
