import 'package:ecommerce_app/home/domain/products_model.dart';

abstract class AbHome {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getfilteredProducts(String category);
  Future<List> getCategory();
}
