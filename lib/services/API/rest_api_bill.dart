import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flexi_business_hub/models/business_acc_model.dart';
import 'package:flexi_business_hub/models/product_model.dart';
import 'package:flexi_business_hub/services/dio_config.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:http_parser/http_parser.dart';
import '../../models/bill_model.dart';

class CallAPI {
  // สร้าง Dio Instance
  final Dio _dioWithAuth = DioConfig.dioWithAuth;

  //-----------------Get All bills API ---------------------//

  Future<List<BillModel>> getAllBills() async {
    final response = await _dioWithAuth.get('bill');
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      final List<BillModel> bills = billModelFromJson(
        json.encode(response.data),
      );
      return bills;
    }
    throw Exception('Failed to load bills');
  }
//-----------------Create bill API Method ---------------------//

  Future<String> addBillAPI(BillModel bill, {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'purchaseAt': bill.createAt,
      'cName': bill.cName,
      'cLastname': bill.cLastname,
      'cPhone': bill.cPhone,
      'cGender': bill.cGender,
      'product': bill.product,
      'amount': bill.amount,
      'price': bill.price,
      'cAdress': bill.cAdress,
      'cProvince': bill.cProvince,
      'cPostId': bill.cPostId,
      'payment': bill.payment,
      'cashStatus': bill.cashStatus,
      'platform': bill.platform,
      'memberId': bill.memberId,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    final response = await _dioWithAuth.post('bill', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to create bill');
  }

// Delete bill API Method
  Future<String> deleteBillAPI(int id) async {
    final response = await _dioWithAuth.delete('Bill/$id');
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to delete bill');
  }


// Update a bill API Method by id
  Future<String> updateBillAPI(BillModel bill, {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'cName': bill.cName,
      'cLastname': bill.cLastname,
      'cPhone': bill.cPhone,
      'cGender': bill.cGender,
      'product': bill.product,
      'amount': bill.amount,
      'price': bill.price,
      'cAdress': bill.cAdress,
      'cProvince': bill.cProvince,
      'cPostId': bill.cPostId,
      'payment': bill.payment,
      'cashStatus': bill.cashStatus,
      'platform': bill.platform,
      'memberId': bill.memberId,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    }); 
    final response = await _dioWithAuth.put('bill/${bill.id}', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to update bill');
  }

  addBusinessAPI(BusinessAccModel businessAccModel) {}

  addProductAPI(ProductModel product, {File? imageFile}) {}

  getAllProducts() {}
}