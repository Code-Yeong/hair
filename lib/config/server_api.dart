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

// customer >info
  Future<dynamic> addCustomerAddress({String cusId, String name, String phone, String address, String description}) async {
    String url = 'users/addAddress';
    var data = {
      'id': cusId,
      'name': name,
      'phone': phone,
      'address': address,
      'description': description,
    };
    print("address data= $data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  Future<dynamic> editCustomerAddress({String addressId, String newName, String newPhone, String newAddress, String newStatus, String description}) async {
    String url = 'users/updateAddress';
    var data = {
      'id': addressId,
      'name': newName,
      'phone': newPhone,
      'address': newAddress,
      'status': newStatus,
      'description': description,
    };
    print("修改地址请求 request data= $data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  Future<dynamic> getCustomerAddress({String cusId}) async {
    String url = 'users/getAllAddress';
    var data = {'id': cusId};
    print("address data= $data");
    Response res = await _dio.get(url, queryParameters: data);
    return res;
  }

  Future<dynamic> getShopList() async {
    String url = 'shop/getAllShop';
    Response res = await _dio.get(url);
    return res;
  }
}
