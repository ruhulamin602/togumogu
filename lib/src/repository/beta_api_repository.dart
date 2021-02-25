import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:togumogu/src/models/products/category_response.dart';
import 'package:togumogu/src/models/products/p_category.dart';
import 'package:togumogu/src/models/products/product.dart';
import 'package:togumogu/src/models/products/product_response.dart';
// import 'package:flutter_config/flutter_config.dart';

import 'package:togumogu/src/services/api_result.dart';
import 'package:togumogu/src/services/dio_client.dart';
import 'package:togumogu/src/services/network_exceptions.dart';

class BetaAPIRepository {
  DioClient dioClient;

  String _baseUrl = env["BETA_API"] ?? "http://betaapi.togumogu.com/api";

  BetaAPIRepository() {
    var dio = Dio();

    dioClient = DioClient(_baseUrl, dio);
  }

  Future<ApiResult<List<Category>>> fetchCatergories() async {
    try {
      final response = await dioClient.get(
        "/en/product/categories",
        // queryParameters: {"per_page": 4},
      );

      List<Category> categories = CategoryResponse.fromJson(response).data;
      // print(response);
      return ApiResult.success(data: categories);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<Product>>> fetchCatWiseProd(String category) async {
    try {
      final response = await dioClient.get(
        "/en/product/products?category=$category",
        // queryParameters: {"category":category},
      );

      List<Product> categories = ProductResponse.fromJson(response).data;
      // print(response);
      return ApiResult.success(data: categories);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
