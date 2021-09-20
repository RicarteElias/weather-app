import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class Http extends DioForNative {
  Http() {
    super.options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    super.interceptors.add(InterceptorsWrapper(onResponse: (response, handler) {
          if ([
            "ZERO_RESULTS",
            "OVER_DAILY_LIMIT",
            "OVER_QUERY_LIMIT",
            "REQUEST_DENIED",
            "INVALID_REQUEST",
            "UNKNOWN_ERROR"
          ].contains(response.statusMessage)) {
            return handler.reject(DioError(
                error: response.statusMessage,
                requestOptions: response.requestOptions));
          }
          return handler.next(response);
        }, onError: (DioError e, handler) {
          return handler.next(e);
        }));
  }
}
