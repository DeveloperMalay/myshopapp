import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_items_model.freezed.dart';
part 'cart_items_model.g.dart';



@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required int id,
    required int userId,
    required String date,
    required List<Product> products,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    int? productId,
    int? quantity,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
