import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hair/model/barber.dart';
import 'package:hair/model/customer.dart';
import 'package:hair/utils/enum.dart';

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

  Future<Response> regist({String phone, String name, String password, Role role}) async {
    String url = role == Role.customer ? 'users/regist' : 'barber/regist';
    var data = {
      'phone': phone,
      'name': name,
      'password': password,
    };
    Response res = await _dio.post(url, data: data);
    return res;
  }

  Future<dynamic> signIn({Role role, String phone, String password}) async {
    String url = role == Role.customer ? 'users/login' : 'barber/login';
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

  Future<dynamic> editCustomerAddress(
      {String addressId, String cusId, String newName, String newPhone, String newAddress, String newStatus, String description}) async {
    String url = 'users/updateAddress';
    var data = {
      'id': addressId,
      "cusId": cusId,
      'name': newName,
      'phone': newPhone,
      'address': newAddress,
      'status': newStatus,
      'description': description,
    };
    print("修改地址请求 request data= $data");
    Response res = await _dio.post(url, data: data);
    print("修改地址结果:$res");
    return res;
  }

  Future<dynamic> removeCustomerAddress({String addressId}) async {
    String url = 'users/deleteAddress';
    var data = {
      'id': addressId,
    };
    print("删除地址请求 request data= $data");
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

//============================================================================
  Future<dynamic> getShopList() async {
    String url = 'shop/getAllShop';
    Response res = await _dio.get(url);
    return res;
  }

  //获取店铺的评分、订单数量
  Future<dynamic> getShopStatistic({String shopId}) async {
    String url = 'shop/shopStatistic';
    var data = {
      "shopId": shopId,
    };
    Response res = await _dio.get(url, queryParameters: data);
    return res;
  }

//============================================================================
  //增加订单
  Future<dynamic> addOrder({String cusId, String serveName, String barberId, String shopId, String serveTime, num money}) async {
    String url = 'order/addOrder';
    var data = {
      "cusId": cusId,
      "barberId": barberId,
      "shopId": shopId,
      "serveTime": serveTime,
      "serveName": serveName,
      "money": money,
    };
    print("新增订单 request data= $data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  //查询客户、店铺、理发师对应的"所有"订单
  Future<dynamic> getOrderList({String id, Role role}) async {
    String url;
    String idName;
    if (role == Role.shop) {
      url = 'order/getShopOrder';
      idName = "shopId";
    } else if (role == Role.customer) {
      url = 'order/getCusOrder';
      idName = "cusId";
    } else {
      url = 'order/getStaffOrder';
      idName = "barberId";
    }
    var data = {idName: id};
    print("查询订单 request data= $url, data=$data");
    Response res = await _dio.get(url, queryParameters: data);
    return res;
  }

  //查询理发师对应的"所有未完成"订单
  Future<dynamic> getBarberUnStartOrder({String id}) async {
    String url;
    String idName;
    url = 'order/getBarberUnStartOrder';
    idName = "barberId";
    var data = {idName: id};
    print("查询理发师所有未完成的订单 request data= $url, data=$data");
    Response res = await _dio.get(url, queryParameters: data);
    return res;
  }

  //修改理发师对应的"所有未完成"订单
  Future<dynamic> editOrderStatus({String orderId, String status}) async {
    String url = 'order/updateOrderStatus';
    var data = {
      'id': orderId,
      'status': status,
    };
    print("修改订单的data ：$data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  //修改理发师对应的"所有未完成"订单
  Future<dynamic> verifyOrder({String orderId}) async {
    String url = 'order/updateVerifiedStatus';
    var data = {
      'id': orderId,
    };
    print("修改订单的data ：$data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  //查询理发师对应的"所有未完成"订单
  Future<dynamic> commentOrder({String orderId, String content, num barberScore, num shopScore}) async {
    String url = 'order/commentOrder';
    var data = {
      'id': orderId,
      'barberScore': barberScore,
      'shopScore': shopScore,
      'content': content,
    };
    print("评价订单的data ：$data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  //用户扫码确认订单
  Future<dynamic> scanFinishReservation({num rId, num cusId, num barberId}) async {
    String url = 'order/scan';
    var data = {
      'rId': rId,
      'cusId': cusId,
      'barberId': barberId,
    };
    print("用户扫码请求数据 ：$data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  Future<dynamic> listenReservationStatus({String rId}) async {
    String url = 'order/listen/status';
    print('正在监听当前订单扫码状态');

    var data = {
      'rId': rId,
    };

    Response res = await _dio.get(url, queryParameters: data);
    return res;
  }

  //修改用户信息（理发师或者客户）
  Future<dynamic> updateUserInfo({Customer cus, Barber barber, Role role}) async {
    String url;
    var data;
    if (role == Role.customer) {
      url = 'users/update';
      data = {
        'name': cus.name,
        'avatar': cus.avator,
        'nickName': cus.nickName,
        'phone': cus.phone,
        'description': cus.description,
        'sex': cus.gender,
        'id': cus.id,
      };
    }
    print("修改用户信息 Role：$role, data: $data");
    Response res = await _dio.post(url, data: data);
    return res;
  }

  //根据理发师id查询评论内容
  Future<dynamic> getBarberComment({String barberId}) async {
    String url = 'order/comments/barber';
    var data = {
      'barberId': barberId,
    };
    print("根据理发师id查询评论内容, data: $data");
    Response res = await _dio.get(url, queryParameters: data);
    return res;
  }

  //根据理发师id查询评论内容
  Future<dynamic> getServeList() async {
    String url = 'serve/list';
    print("查询所有服务类型list");
    Response res = await _dio.get(url);
    return res;
  }

  upLoadImage({File image, String id, Role role}) async {
    String url = 'http://wd.chivan.cn:3000/file/upload/avatar';
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = new FormData.from(
      {
        "id": id,
        "role": role.index,
        "image": new UploadFileInfo(
          new File(path),
          name,
        ),
      },
    );

    print('${new File(path)}');
    Dio dio = new Dio();
    Response res = await dio.post(url, data: formData);
    return res;
  }

  staffVerify({File image, String id, String name, String idCard}) async {
    String url = 'http://wd.chivan.cn:3000/file/barber/verify';
    String path = image.path;
    var _name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = new FormData.from(
      {
        "id": id,
        "name": name,
        'idcard': idCard,
        "image": new UploadFileInfo(
          new File(path),
          _name,
        ),
      },
    );

    Dio dio = new Dio();
    Response res = await dio.post(url, data: formData);
    return res;
  }

  applyOrCancelShop({String bId, String shopId, num handle}) async {
    String url = 'barber/join/shop';
    var data = {
      'id': bId,
      'shopId': shopId,
      'handle': handle,
    };
    print("申请或取消加入店铺 data: $data");
    Response res = await _dio.post(url, data: data);
    return res;
  }
}
