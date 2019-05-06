import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class ShopListPageViewModel {
  final List<Shop> shopList;
  ShopListPageViewModel({this.shopList});

  static ShopListPageViewModel fromStore(Store<AppState> store) {
    return ShopListPageViewModel(
      shopList: store.state.shopState.shopList ?? [],
    );
  }
}
