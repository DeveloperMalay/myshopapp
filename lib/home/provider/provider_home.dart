import 'package:ecommerce_app/core/provider/core_provider.dart';
import 'package:ecommerce_app/home/domain/products_model.dart';
import 'package:ecommerce_app/home/infra/service_home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider_home.g.dart';

@riverpod
ServiceHome serviceHome<AbHome>(ServiceHomeRef ref) {
  return ServiceHome(
    ref.watch(dioProvider),
  );
}
final getProductsProvider=  FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  return ref.watch(serviceHomeProvider).getProducts();
});