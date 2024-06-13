import 'dart:convert';

import 'package:flexi_business_hub/app_router.dart';
import 'package:flexi_business_hub/components/custom_textfield.dart';
import 'package:flexi_business_hub/components/rounded_button.dart';
import 'package:flexi_business_hub/models/business_acc_model.dart';
import 'package:flexi_business_hub/services/API/rest_api_business_acc.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:flutter/material.dart';

class MemberForm extends StatelessWidget {
  MemberForm({super.key});

// Create Global Key
  final _formKeyMember = GlobalKey<FormState>();

// Create TextEditingController form BusinessAccModel
  final _roleController = TextEditingController(text: 'Owner');
  final _permissionController = TextEditingController(text: 'Full Access');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Member Form",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKeyMember,
            child: Column(
              children: [
                customTextField(
                  controller: _roleController,
                  hintText: "Role",
                  prefixIcon: const Icon(Icons.person),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกบทบาท";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                  controller: _permissionController,
                  hintText: "Permission",
                  prefixIcon: const Icon(Icons.person),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณากรอกสิทธิ์";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  label: "CREATE BUSINESS ACCOUNT UP",
                  onPressed: () async {
                    // ตรวจสอบข้อมูลฟอร์ม
                    if (_formKeyMember.currentState!.validate()) {
                      // ถ้าข้อมูลถูกต้อง ให้ทำการบันทึกข้อมูล
                      _formKeyMember.currentState!.save();

                      // แสดงข้อมูลที่บันทึกได้ทาง Console
                      print("role: ${_roleController.text}");
                      print("permission: ${_permissionController.text}");
                      print(
                          "memberId: ${Utility.getSharedPreference('memberId')}"); // from business_acc
                      print("userId: ${Utility.getSharedPreference('userId')}"); // from register

                      //เรียกใข้งาน API Register
                      var response = await CallAPI().addBusinessAPI({
                        "role": _roleController.text,
                        "permission": _permissionController.text,
                        "memberId": Utility.getSharedPreference('memberId'),
                        "userId": Utility.getSharedPreference('userId'),
                      } as BusinessAccModel);

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
                        
                        // ส่งไปหน้า Dashboard
                        Navigator.pushReplacementNamed(
                            context, AppRouter.dashboard);
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
