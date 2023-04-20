import 'package:ecommerce_app/home/domain/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_model.freezed.dart';

@freezed
class MasterPaginationModel<T> with _$MasterPaginationModel<T> {
  MasterPaginationModel._();
  factory MasterPaginationModel({
    @Default([]) List<ProductModel> posts,
    @Default(10) int page,
    @Default('') String errorMessage,
    @Default(false) bool initialLoaded,
    @Default(false) bool isPaginationLoading,
  }) = _MasterPaginationModel;
  bool get refershError => errorMessage != '' && posts.length <= 10;
  // @override
  // MasterPaginationModel copyWith({
  //   List<ProductModel>? posts,
  //   int? page,
  //   String? errorMessage,
  //   bool? initialLoaded,
  //   bool? isPaginationLoading,
  // }) {
  //   return MasterPaginationModel(
  //       posts: posts ?? this.posts,
  //       page: page ?? this.page,
  //       errorMessage: errorMessage ?? this.errorMessage,
  //       initialLoaded: initialLoaded ?? this.initialLoaded,
  //       isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading);
  // }
}
