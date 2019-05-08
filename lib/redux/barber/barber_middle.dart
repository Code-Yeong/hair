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
        globalStore.dispatch(new ReceivedShopListAction(shopList: shopList));
      } else {
        print('获取商铺信息失败');
      }
    }
  }
}
