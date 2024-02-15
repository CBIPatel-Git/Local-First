import 'package:dio/dio.dart' as dio_link;

import 'api_config.dart';

class APIProvider {
  static dio_link.Dio? dio = dio_link.Dio(options);

  // dio_link.CancelToken cancelToken= dio_link.CancelToken();
  // static dio_link.Dio dio = dio_link.Dio(dio_link.BaseOptions(baseUrl: ApiConfig.baseUrl));

  static dio_link.BaseOptions? options = dio_link.BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (code) {
        if (code! >= 200) {
          return true;
        }
        return false;
      });

  // options!.headers["content-type"] = "application/json";
  static dio_link.Dio getDio() {
    return dio!;
  }
}
