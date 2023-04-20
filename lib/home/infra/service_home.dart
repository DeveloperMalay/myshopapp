import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/home/domain/ab_home.dart';
import 'package:ecommerce_app/home/domain/products_model.dart';

import '../domain/cart_items_model.dart';

class ServiceHome implements AbHome {
  ServiceHome(this.dio);

  final Dio dio;
  @override
  Future<List<ProductModel>> getProducts(int limit) async {
    try {
      final response =
          await dio.get('${baseUrl}products', queryParameters: {'limit': 10});
      final List<ProductModel> data = (response.data as List).map((e) {
        return ProductModel.fromJson(e);
      }).toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List> getCategory() async {
    try {
      final response = await dio.get('${baseUrl}products/categories');
      List data = response.data as List;
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getfilteredProducts(String category) async {
    try {
      final response = await dio.get('${baseUrl}products/category/$category');
      final List<ProductModel> data = (response.data as List).map((e) {
        return ProductModel.fromJson(e);
      }).toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CartModel>> getcartItems() async {
    try {
      final cartres = await dio.get('${baseUrl}carts');
      final List<CartModel> cartdata = (cartres.data as List).map((e) {
        return CartModel.fromJson(e);
      }).toList();
      // final response = await dio.get('${baseUrl}products/${cartdata}');
      // final List<ProductModel> data = (response.data as List).map((e) {
      //   return ProductModel.fromJson(e);
      // }).toList();
      return cartdata;
    } catch (e) {
      rethrow;
    }
  }
}
