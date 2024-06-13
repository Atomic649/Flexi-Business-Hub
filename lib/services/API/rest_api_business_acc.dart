import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flexi_business_hub/models/business_acc_model.dart';
import 'package:flexi_business_hub/services/dio_config.dart';
import 'package:flexi_business_hub/utils/utility.dart';

class CallAPI {
  // สร้าง Dio Instance
  final Dio _dioWithAuth = DioConfig.dioWithAuth;

  

  // Create Business Account  form BusinessAcc Model
  Future<String> addBusinessAPI(BusinessAccModel businessAcc) async {
    FormData data = FormData.fromMap({
      'businessName': businessAcc.businessName,
      'vatId': businessAcc.vatId,
      'businessType': businessAcc.businessType,
      'taxType': businessAcc.taxType,
      'userId': businessAcc.userId,
      'memberId': businessAcc.memberId,
    });

    final response = await _dioWithAuth.post('businessAcc', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to create businessAcc');
  }

    // Update Business Account  form BusinessAcc Model
  Future<String> updateBusinessAPI(BusinessAccModel businessAcc) async {
    FormData data = FormData.fromMap({
      'businessName': businessAcc.businessName,
      'vatId': businessAcc.vatId,
      'businessType': businessAcc.businessType,
      'taxType': businessAcc.taxType,
      'userId': businessAcc.userId,
      'memberId': businessAcc.memberId,
    });

    final response = await _dioWithAuth.put('businessAcc/${businessAcc.id}', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to create businessAcc');
  }
}