import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/store.dart';
import 'package:redux/redux.dart';

class StaffShopPageViewModel {
  final List<Shop> shopList;
  StaffShopPageViewModel({this.shopList});

  static StaffShopPageViewModel fromStore(Store<AppState> store) {
    return StaffShopPageViewModel(
      shopList: store.state.shopState.shopList ?? [],
    );
  }

  Shop get myShop {
    String shopId = globalStore.state.staffInfoState.barber?.shop ?? null;
    String shopStatus = globalStore.state.staffInfoState.barber?.shopStatus ?? null;
    if (shopId == null) {
      return null;
    }
    List<Shop> myShopList = this.shopList.where((shop) => shop.id == shopId && shopStatus == '2').toList();
    if (myShopList.length > 0) {
      return myShopList.first;
    }
    return null;
  }
}
