import 'dart:convert';


import 'package:flexi_business_hub/app_router.dart';
import 'package:flexi_business_hub/components/custom_textfield.dart';
import 'package:flexi_business_hub/components/rounded_button.dart';
import 'package:flexi_business_hub/models/business_acc_model.dart';
import 'package:flexi_business_hub/services/API/rest_api_bill.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';


class BusinessAccForm extends StatelessWidget {
  BusinessAccForm({super.key});

// Create Global Key
  final _formKeyBusinessAcc = GlobalKey<FormState>();

// Create TextEditingController form BusinessAccModel
  final _businessNameController = TextEditingController(text: 'Atomic Intergroup');
  final _vatIdController = TextEditingController(text: '0105565126775');
  final _businessTypeController = TextEditingController(text:'Online Retail' );
  final _taxTypeController = TextEditingController(text: 'Juristic');
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "ลงทะเบียน",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKeyBusinessAcc,
            child: Column(
              children: [
                customTextField(
                  controller: _businessNameController,
                  hintText: "Business Name",
                  prefixIcon: const Icon(Icons.person),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกชื่อธุรกิจ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                  controller: _vatIdController,
                  hintText: "Vat Id",
                  prefixIcon: const Icon(Icons.person),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกเลขประจําตัวผู้เสียภาษี";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                  controller: _businessTypeController,
                  hintText: "Business Type",
                  prefixIcon: const Icon(Icons.email),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกประเภทธุรกิจ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                  controller: _taxTypeController,
                  hintText: "Tax Type",
                  prefixIcon: const Icon(Icons.email),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกประเภทภาษี";
                    }
                    return null;
                  },
                ),
                RoundedButton(
                  label: "CREATE BUSINESS ACCOUNT UP",
                  onPressed: () async {
                    // ตรวจสอบข้อมูลฟอร์ม
                    if (_formKeyBusinessAcc.currentState!.validate()) {
                      // ถ้าข้อมูลถูกต้อง ให้ทำการบันทึกข้อมูล
                      _formKeyBusinessAcc.currentState!.save();

                      // แสดงข้อมูลที่บันทึกได้ทาง Console
                      print("Business: ${_businessNameController.text}");
                      print("Vat Id: ${_vatIdController.text}");
                      print("Business Type: ${_businessTypeController.text}");
                      print("Tax Type: ${_taxTypeController.text}");                      
                      print("userId: ${Utility.getSharedPreference('userId')}");

                      //เรียกใข้งาน API Register
                      var response = await CallAPI().addBusinessAPI(
                        {
                          "businessName": _businessNameController.text,
                          "vatId": _vatIdController.text,
                          "businessType": _businessTypeController.text,
                          "taxType": _taxTypeController.text,
                          "userId": Utility.getSharedPreference('userId'),
                          
                        } as BusinessAccModel
                        
                      );

                      var body = jsonDecode(response);

                      Utility().logger.i(body);

                      if (body['message'] == 'No Network Connection') {
                        // แจ้งเตือนว่าไม่มีการเชื่อมต่อ Internet
                        Utility.showAlertDialog(
                            context, 'แจ้งเตือน', body['message']);

                        // save data in shared preferences
                        await Utility.setSharedPreference(
                            'businessName', body['businessName']);

                        await Utility.setSharedPreference(
                            'vatId', body['vatId']);

                        await Utility.setSharedPreference(
                            'businessType', body['businessType']);

                        await Utility.setSharedPreference(
                            'taxType', body['taxType']);

                        await Utility.setSharedPreference(
                            'userId', body["user"]['userId']);

                        await Utility.setSharedPreference(
                            'memberId', body["member"]['memberId']);

                        // go to memberscreen
                        Navigator.pushReplacementNamed(
                            context, AppRouter.memberScreen);

                        // // ส่งไปหน้า Dashboard
                        // Navigator.pushReplacementNamed(
                        //     context, AppRouter.dashboard);
                      } else {
                        // แจ้งเตือนว่าเข้าสู่ระบบไม่สำเร็จ
                        Utility.showAlertDialog(
                            context, body["status"], '${body["message"]}');
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
