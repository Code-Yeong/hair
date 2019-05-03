import 'package:dio/dio.dart';

class ServerApi {
  ServerApi();
  static ServerApi get api => ServerApi();
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://www.xx.com/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  final Dio _dio = new Dio(options);

  Future<dynamic> requestUrl() async {
    Response res = await _dio.get('baidu.com');
    return res.data;
  }
}
