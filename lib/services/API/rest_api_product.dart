import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flexi_business_hub/models/product_model.dart';
import 'package:flexi_business_hub/services/dio_config.dart';
import 'package:flexi_business_hub/utils/utility.dart';
import 'package:http_parser/http_parser.dart';


class CallAPI {
  // สร้าง Dio Instance
  final Dio _dioWithAuth = DioConfig.dioWithAuth;

  
  //-----------------------Get All Product API -------------------------------//

  Future<List<ProductModel>> getAllProducts() async {
    final response = await _dioWithAuth.get('Product');
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
      'categoryId': product.categoryId,
      'userId': product.memberId,
      'statusId': product.statusId,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response = await _dioWithAuth.post('Product', data: data);
    if (response.statusCode == 200) {
      Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to create product');
  }

  // ---------------------Delete Product API Method ---------------------------//

  Future<String> deleteProductAPI(int id) async {
    final response = await _dioWithAuth.delete('Product/$id');
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
      'categoryId': product.categoryId,
      'userId': product.memberId,
      'statusId': product.statusId,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
        await _dioWithAuth.put('product/${product.id}', data: data);
    if (response.statusCode == 200) {
      // Utility().logger.d(response.data);
      return jsonEncode(response.data);
    }
    throw Exception('Failed to update product');
  }
  // ---------------------------------------------------------------------------


}
