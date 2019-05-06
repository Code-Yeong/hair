import 'package:hair/redux/shop/shop_action.dart';
import 'package:hair/redux/shop/shop_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final shopReducers = combineReducers<ShopState>([
  new TypedReducer<ShopState, ReceivedShopListAction>(_receivedShopList),
]);

ShopState _receivedShopList(ShopState state, ReceivedShopListAction action) {
  return state.copyWith(
    shopList: action.shopList,
    loadingStatus: LoadingStatus.success,
  );
}
