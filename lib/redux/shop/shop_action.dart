import 'package:hair/model/Serve.dart';
import 'package:hair/model/shop.dart';

//接收到所有商铺列表的发出
class ReceivedShopListAction {
  final List<Shop> shopList;
  ReceivedShopListAction({this.shopList});
}

//要获取所有商铺列表时发出
class BeginFetchShopListAction {}

//-------------------------------------
//要获取某个商铺详细信息时调用
class BeginFetchShopDetailAction {
  String shopId;
  BeginFetchShopDetailAction({this.shopId});
}

//获取到了某个商铺详细信息时发出
class ReceivedShopDetailAction {
  final Shop shop;
  ReceivedShopDetailAction({this.shop});
}

//获取某个商铺详细信息失败时发出
class FetchShopDetailFailedAction {}

//-------------------------------------
//要获取所有服务类型
class BeginFetchServeListAction {
  BeginFetchServeListAction();
}

//获取到了服务类型详细信息时发出
class ReceivedServeListAction {
  final List<Serve> serveList;
  ReceivedServeListAction({this.serveList});
}

//获取服务类型详细信息失败时发出
class FetchServeListFailedAction {}

//-------------------------------------
//选中某个店铺时发出,保存被选中的商铺id，以便在进入商铺详情页时取用
class SelectedShopAction {
  final String id;
  SelectedShopAction({this.id});
}
