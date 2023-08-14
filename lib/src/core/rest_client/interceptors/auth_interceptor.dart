import 'dart:io';

import 'package:dio/dio.dart';

import '../../global/constantes.dart';
import '../../global/global_context.dart';
import '../../storage/storege.dart';

final class AuthInterceptor extends Interceptor {
  final Storage storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = storage.getData(SessionStorageKeys.accessToken.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      GlobalContext.instance.loginExpire();
      return;
    }
    return handler.next(err);
  }
}
