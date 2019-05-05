import 'package:dio/dio.dart';

//GET（SELECT）：从服务器取出资源（一项或多项）。
//POST（CREATE）：在服务器新建一个资源。
//PUT（UPDATE）：在服务器更新资源（客户端提供改变后的完整资源）。
//PATCH（UPDATE）：在服务器更新资源（客户端提供改变的属性）。
//DELETE（DELETE）
class ServerApi {
  ServerApi();
  static ServerApi get api => ServerApi();
  static BaseOptions options = new BaseOptions(
    baseUrl: "http://wd.chivan.cn:3000/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  final Dio _dio = new Dio(options);
//  final Dio _dio = new Dio();

  Future<Response> customerRegist({String phone, String name, String password}) async {
    String url = 'users/regist';
    var data = {
      'phone': phone,
      'name': name,
      'password': password,
    };
    Response res = await _dio.post(url, data: data);
    return res;
  }

  Future<dynamic> customerSignIn({String phone, String password}) async {
    String url = 'users/login';
    var data = {
      'phone': phone,
      'password': password,
    };
    Response res = await _dio.get(url, queryParameters: data);
    return res;
  }

  Future<dynamic> requestUrl() async {
    Response res = await _dio.get('www.baidu.com');
    return res.data;
  }
}
