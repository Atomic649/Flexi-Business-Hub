import 'dart:convert';
import 'dart:io';
import 'package:flexi_business_hub/models/bill_model.dart';
import 'package:flexi_business_hub/screens/bills/components/bill_form.dart';
import 'package:flexi_business_hub/screens/buttomnavpage/income_screen.dart';
import 'package:flexi_business_hub/services/API/rest_api_bill.dart';
import 'package:flutter/material.dart';

//import 'package:intl/intl.dart';

class BillAdd extends StatefulWidget {
  const BillAdd({super.key});

  @override
  State<BillAdd> createState() => _BillAddState();
}

class _BillAddState extends State<BillAdd> {
  //สร้าง GlobalKey สำหรับฟอร์ม
  final _formKeyAddBill = GlobalKey<FormState>();

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
    
    
    //purchaseAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
  );

  // ไฟล์รูปภาพ
  File? _imageFile;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Bill'),
       actions: [
        // Save Button
        IconButton(
          onPressed: () async {
            if (_formKeyAddBill.currentState!.validate()) {
              _formKeyAddBill.currentState!.save();

              // Call API Add Bill
              var response =
                  await CallAPI().addBillAPI(_bill, imageFile: _imageFile);

              var body = jsonDecode(response);

              if (body['status'] == 'ok') {
                if (!mounted)
                  return; // กรณีที่ออกจากหน้าจอแล้ว ไม่ต้องทำอะไรต่อ
                Navigator.pop(
                    context, true); // ปิดหน้าต่างและส่งค่ากลับไปยังหน้าก่อนหน้า

                // อัพเดตหน้าจอ HomeScreen
                refreshKey.currentState?.show();
              }
            }
          },
          icon: const Icon(Icons.save),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          BillForm(
            _bill,
            callBackSetImage: _callBackSetImage,
            formKey: _formKeyAddBill,
          ),

        ]),
      ),
    );
  }

// ฟังก์ชันสำหรับเลือกรูปภาพ
  void _callBackSetImage(File? imageFile) {
    setState(() {
      _imageFile = imageFile;
    });
  }
}
