import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    CustomRoute(
        path: '/',
        page: HomeRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 500),
    CustomRoute(
        page: ProductDetailsRoute.page,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        durationInMilliseconds: 500),
    CustomRoute(
        page: CartRoute.page,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        durationInMilliseconds: 500),
  ];
}
