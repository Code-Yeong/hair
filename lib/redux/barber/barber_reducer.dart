import 'package:hair/model/shop.dart';
import 'package:hair/redux/shop/shop_action.dart';
import 'package:hair/redux/shop/shop_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final shopReducers = combineReducers<ShopState>([
  new TypedReducer<ShopState, ReceivedShopListAction>(_receivedShopList),
  new TypedReducer<ShopState, ReceivedShopDetailAction>(_receivedShopDetail),
  new TypedReducer<ShopState, FetchShopDetailFailedAction>(_loadFailedShopDetail),
  new TypedReducer<ShopState, SelectedShopAction>(_selectedShop),
]);

ShopState _receivedShopList(ShopState state, ReceivedShopListAction action) {
  return state.copyWith(
    shopList: action.shopList,
    loadingStatus: LoadingStatus.success,
  );
}

ShopState _receivedShopDetail(ShopState state, ReceivedShopDetailAction action) {
  List<Shop> oldShopList = state.shopList;
  List<Shop> newShopList = oldShopList.map((item) {
    if (item.id == action.shop.id) {
      return action.shop;
    } else {
      return item;
    }
  }).toList();
  return state.copyWith(
    loadingStatus: LoadingStatus.success,
    shopList: newShopList,
  );
}

ShopState _loadFailedShopDetail(ShopState state, FetchShopDetailFailedAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.failed,
  );
}

ShopState _selectedShop(ShopState state, SelectedShopAction action) {
  print("selected:${action.id}");
  return state.copyWith(
    selectedShopId: action.id,
  );
}
