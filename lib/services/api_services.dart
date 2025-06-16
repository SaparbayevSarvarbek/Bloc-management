import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<List<ProductModel>> getData() async {
    List<ProductModel> dataList = [];
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data as List<dynamic>;
        dataList = jsonList
            .map(
              (jsonItem) =>
                  ProductModel.fromJson(jsonItem as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw Exception('Serverda xatolik ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Xatolik $e');
    }
    return dataList;
  }
}
