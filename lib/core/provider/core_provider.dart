import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioAuth(DioAuthRef ref) {
  BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {"accept": 'application/json'},
    validateStatus: (status) => status != null && status >= 200 && status < 400,
  );
  return Dio(options);
}

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return Dio();
}
