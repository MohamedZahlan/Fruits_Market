import 'package:dio/dio.dart';

class Dio_Helper {
  static Dio dio = Dio();

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
    dynamic query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json",
    };
    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> getData({
    required String url,
    dynamic data,
    dynamic query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json",
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
