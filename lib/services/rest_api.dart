import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flexi_business_hub/models/product_model.dart';
import 'package:flexi_business_hub/services/dio_config.dart';
import 'package:flexi_business_hub/utils/utility.dart';

import 'package:http_parser/http_parser.dart';
import '../models/bill_model.dart';

class CallAPI {
  // สร้าง Dio Instance
  final Dio _dio = DioConfig.dio;
  final Dio _dioWithAuth = DioConfig.dioWithAuth;

  //-------------------------------Register API -------------------------------//
  registerAPI(data) async {
    // Check Network Connection
    if (await Utility.checkNetwork() == '') {
      return jsonEncode({'message': 'No Network Connection'});
    } else {
      try {
        final response = await _dio.post('auth/register', data: data);
        Utility().logger.d(response.data);
        return jsonEncode(response.data);
      } catch (e) {
        Utility().logger.e(e);
      }
    }
  }

  // ------------------------------Login API----------------------------------//
  loginAPI(data) async {
    // Check Network Connection
    if (await Utility.checkNetwork() == '') {
      return jsonEncode({'message': 'No Network Connection'});
    } else {
      try {
        final response = await _dio.post('auth/login', data: data);
        Utility().logger.d(response.data);
        return jsonEncode(response.data);
      } catch (e) {
        Utility().logger.e(e);
      }
    }
  }

  //-----------------------Get All Product API -------------------------------//

  Future<List<ProductModel>> getAllProducts() async {
    final response = await _dioWithAuth.get('products');
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      final List<ProductModel> products = productModelFromJson(
        json.encode(response.data),
      );
      return products;
    }
    throw Exception('Failed to load products');
  }

  //------------------------Create Product API Method ------------------------//

  Future<String> addProductAPI(ProductModel product, {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'name': product.name,
      'description': product.description,
      'barcode': product.barcode,
      'stock': product.stock,
      'price': product.price,
      'category_id': product.categoryId,
      'user_id': product.userId,
      'status_id': product.statusId,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response = await _dioWithAuth.post('products', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to create product');
  }

  // ---------------------Delete Product API Method ---------------------------//

  Future<String> deleteProductAPI(int id) async {
    final response = await _dioWithAuth.delete('products/$id');
    if (response.statusCode == 200) {
      // Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to delete product');
  }

  //-----------------------Update Product API Method --------------------------//

  Future<String> updateProductAPI(ProductModel product,
      {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'name': product.name,
      'description': product.description,
      'barcode': product.barcode,
      'stock': product.stock,
      'price': product.price,
      'category_id': product.categoryId,
      'user_id': product.userId,
      'status_id': product.statusId,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
        await _dioWithAuth.put('products/${product.id}', data: data);
    if (response.statusCode == 200) {
      // Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to update product');
  }
  // ---------------------------------------------------------------------------

//------------------------  ----BILLS API----------------------------------------//

  //-----------------Get All bills API ---------------------//

  Future<List<BillModel>> getAllBills() async {
    final response = await _dioWithAuth.get('bills');
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      json.encode(response.data);
      final List<BillModel> bills = billModelFromJson(
        json.encode(response.data),
      );
      return bills;
    }
    throw Exception('Failed to load bills');
  }

//-----------------Create bills API Method ---------------------//

  Future<String> addBillAPI(BillModel bill, {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'cName': bill.cName,
      'cphone': bill.cPhone,
      'cgender': bill.cGender,
      'product': bill.product,
      'amount': bill.amount,
      'price': bill.price,
      'cAdress': bill.cAdress,
      'cProvence': bill.cProvince,
      'cPostId': bill.cPostId,
      'payment': bill.payment,     
      'cashStatus': bill.cashStatus,
      'platform': bill.platform,
      'memberId': bill.memberId,
      'updatedAt': bill.updatedAt,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response = await _dioWithAuth.post('bills', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to create bills');
  }
  // ---------------------Delete Product API Method ---------------------------//

  Future<String> deleteBillAPI(int billId) async {
    final response = await _dioWithAuth.delete('bills/$billId');
    if (response.statusCode == 200) {
      // Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to delete product');
  }

  //---------------------Update Product API Method --------------------------//
  Future<String> updateBillAPI(BillModel bill, {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'cName': bill.cName,
      'cphone': bill.cPhone,
      'cgender': bill.cGender,
      'product': bill.product,
      'amount': bill.amount,
      'price': bill.price,
      'cAdress': bill.cAdress,
      'cProvence': bill.cProvince,
      'cPostId': bill.cPostId,
      'payment': bill.payment,     
      'cashStatus': bill.cashStatus,
      'platform': bill.platform,
      'memberId': bill.memberId,
      'updatedAt': bill.updatedAt,

      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response = 
    await _dioWithAuth.put('bills/${bill.id}', data: data);
    if (response.statusCode == 200) {
      //Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to update bills');
  }

  //----------------------------------------------------------------//
}
