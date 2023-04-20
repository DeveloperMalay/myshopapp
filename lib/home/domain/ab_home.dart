import 'package:ecommerce_app/home/domain/cart_items_model.dart';
import 'package:ecommerce_app/home/domain/products_model.dart';

abstract class AbHome {
  Future<List<ProductModel>> getProducts(int limit);
  Future<List<ProductModel>> getfilteredProducts(String category);
  Future<List> getCategory();
  Future<List<CartModel>> getcartItems();
}
