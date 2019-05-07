import 'package:hair/config/server_api.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/shop/shop_action.dart';
import 'package:hair/redux/store.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createShopMiddleware() {
  return <Middleware<AppState>>[
    new ShopMiddleware(),
  ];
}

class ShopMiddleware extends MiddlewareClass<AppState> {
  ShopMiddleware();
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    //  获取商铺信息
    if (action is BeginFetchShopListAction) {
      var res = await ServerApi.api.getShopList();
      if (res != null && res?.data['status'] == 100) {
        List<Shop> shopList = Shop.fromObjList(res.data['result']);
        print(shopList);
        globalStore.dispatch(new ReceivedShopListAction(shopList: shopList));
      } else {
        print('获取商铺信息失败');
      }
    }

    ////获取店铺的订单数量、评分和坐标（计算巨鹿）
    if (action is BeginFetchShopDetailAction) {
      String shopId = store.state.shopState.selectedShopId;
      var res = await ServerApi.api.getShopStatistic(shopId: shopId);
      if (res != null && res?.data['status'] == 100) {
        print("detail:$res");
        print("shoplist:${store.state.shopState.shopList.length}");
        List<Shop> shopList = store.state.shopState.shopList.where((item) => item.id == shopId).toList();
        print("length:${shopList.length}");
        Shop shop;
        if (shopList.length > 0) {
          print('赋值:${res.data['result'][0]['score']}');
          shop = shopList.first;
          shop = shop.copyWith(score: res.data['result'][0]['score']?.ceil(), orderCount: res.data['result'][0]['orderCount']);
          print('shop:${shop.toString()}');
        }
        globalStore.dispatch(new ReceivedShopDetailAction(shop: shop));
      } else {
        print('获取商铺信息失败');
      }
    }
  }
}
