import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flexi_business_hub/models/member_model.dart';
import 'package:flexi_business_hub/services/dio_config.dart';
import 'package:flexi_business_hub/utils/utility.dart';


class CallAPI {
  // สร้าง Dio Instance
  final Dio _dioWithAuth = DioConfig.dioWithAuth;

  // Create Member
  Future<String> addMemberAPI(MemberModel product) async {
    FormData data = FormData.fromMap({
      'role': product.role,
      'permission': product.permission,
      
    });

    final response = await _dioWithAuth.post('member', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to create member');
  }
}
