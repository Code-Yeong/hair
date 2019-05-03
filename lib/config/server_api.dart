import 'package:dio/dio.dart';

class ServerApi {
  ServerApi();
  static ServerApi get api => ServerApi();
  static BaseOptions options = new BaseOptions(
    baseUrl: "http://",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  final Dio _dio = new Dio(options);
//  final Dio _dio = new Dio();

  Future<dynamic> requestUrl() async {
    Response res = await _dio.get('www.baidu.com');
    return res.data;
  }
}
