import 'package:ecommerce_app/core/provider/core_provider.dart';
import 'package:ecommerce_app/home/domain/products_model.dart';
import 'package:ecommerce_app/home/infra/service_home.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider_home.g.dart';

@riverpod
ServiceHome serviceHome<AbHome>(ServiceHomeRef ref) {
  return ServiceHome(
    ref.watch(dioProvider),
  );
}

final getProductsProvider =
    FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  return ref.watch(serviceHomeProvider).getProducts();
});

final getCategoryProvider = FutureProvider.autoDispose<List>((ref) async {
  return ref.watch(serviceHomeProvider).getCategory();
});

final getfilteredProductsProvider =
    FutureProvider.autoDispose.family<List<ProductModel>,String >((ref,category) async {
  return ref.watch(serviceHomeProvider).getfilteredProducts(category);
});

// final filteredResponseProvider = Provider.autoDispose.family<List<ProductModel>,String>((ref,category) {
//   // final selectedCategory = ref.watch(selectedCategoryProvider).state;
//   final response = ref.watch(
//       getProductsProvider); // Replace with your own Riverpod function that returns the API response
//   final filteredresponse = ref.watch(getfilteredProductsProvider as ProviderListenable);
//   if (category == 'All') {
//     return response;
//   } else {
//     return filteredresponse;
//   }
// });
