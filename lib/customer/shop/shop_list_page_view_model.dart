import 'package:hair/model/Serve.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class ShopListPageViewModel {
  final List<Shop> shopList;
  final List<Serve> serveList;
  final String selectedShopId;
  ShopListPageViewModel({this.shopList, this.serveList, this.selectedShopId});

  static ShopListPageViewModel fromStore(Store<AppState> store) {
    return ShopListPageViewModel(
      shopList: store.state.shopState.shopList ?? [],
      serveList: store.state.shopState.serveList ?? [],
      selectedShopId: store.state.shopState.selectedShopId ?? null,
    );
  }

  Shop get selectedShop {
    if (selectedShopId == null) {
      return null;
    }
    List<Shop> selectedShopList = this.shopList.where((shop) => shop.id == selectedShopId).toList();
    if (selectedShopList.length > 0) {
      return selectedShopList.first;
    }
    return null;
  }
}
