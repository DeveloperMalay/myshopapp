// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:ecommerce_app/home/presentation/cart_page.dart' as _i3;
import 'package:ecommerce_app/home/presentation/home_page.dart' as _i2;
import 'package:ecommerce_app/home/presentation/product_details_page.dart'
    as _i1;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ProductDetailsPage(
          args.imageUrl,
          args.title,
          args.desc,
          args.price,
          args.type,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ProductDetailsPage]
class ProductDetailsRoute extends _i4.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required String imageUrl,
    required String title,
    required String desc,
    required String price,
    required String type,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            imageUrl: imageUrl,
            title: title,
            desc: desc,
            price: price,
            type: type,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i4.PageInfo<ProductDetailsRouteArgs> page =
      _i4.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.price,
    required this.type,
    this.key,
  });

  final String imageUrl;

  final String title;

  final String desc;

  final String price;

  final String type;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{imageUrl: $imageUrl, title: $title, desc: $desc, price: $price, type: $type, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartPage]
class CartRoute extends _i4.PageRouteInfo<void> {
  const CartRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
