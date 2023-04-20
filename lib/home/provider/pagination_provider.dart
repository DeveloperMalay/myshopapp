import 'package:ecommerce_app/home/domain/pagination_model.dart';
import 'package:ecommerce_app/home/domain/products_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MasterPagination<T> extends StateNotifier<MasterPaginationModel<ProductModel>> {
  MasterPagination(
    this.repository, [
    MasterPaginationModel<ProductModel>? state,
  ]) : super(state ?? MasterPaginationModel()) {
    {
      getPosts();
    }
  }

  final Future<List<ProductModel>> Function(int index) repository;

  bool _isAlreadyLoading = false;

  getPosts() async {
    if (_isAlreadyLoading) {
    } else {
      _isAlreadyLoading = true;

      try {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (mounted && state.page > 1) {
            state = state.copyWith(isPaginationLoading: true);
          }
        });
        final fetched = await repository(state.page);

        if (mounted && state.page == 1) {
          state = state.copyWith(initialLoaded: true);
        }

        if (mounted) {
          state = state.copyWith(
            posts: [...state.posts, ...fetched],
            page: state.page + 1,
            isPaginationLoading: false,
          );
        }
      } on Exception {
        state = state.copyWith(
          errorMessage: 'Fetch Error',
          initialLoaded: true,
          isPaginationLoading: false,
        );
      }
      _isAlreadyLoading = false;
    }
  }

  void handleScrollWithIndex(int index) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 10 == 0 && itemPosition != 0;

    final pageToRequest = itemPosition ~/ 10;
    if (requestMoreData && pageToRequest + 1 >= state.page) {
      getPosts();
    }
  }

  Future<void> onRefresh() async {
    state = MasterPaginationModel<ProductModel>();
    await getPosts();
  }
}
