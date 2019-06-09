import 'package:hair/model/Serve.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/utils/enum.dart';

class ShopState {
  final String selectedShopId; //存储在店铺列表页被选中的店铺id
  final List<Shop> shopList;
  final List<Serve> serveList;
  final LoadingStatus loadingStatus;

  ShopState({this.selectedShopId, this.shopList, this.serveList, this.loadingStatus});

  factory ShopState.initial() {
    return ShopState(
      selectedShopId: null,
      loadingStatus: LoadingStatus.init,
      serveList: [],
      shopList: [],
    );
  }

  ShopState copyWith({
    String selectedShopId,
    List<Shop> shopList,
    List<Serve> serveList,
    LoadingStatus loadingStatus,
  }) {
    return ShopState(
      selectedShopId: selectedShopId ?? this.selectedShopId,
      shopList: shopList ?? this.shopList,
      serveList: serveList ?? this.serveList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  Shop findById(String id) {
    if (id == null) {
      return null;
    }
    List<Shop> shopListTemp = this.shopList.where((shop) => shop.id == id).toList();
    if (shopListTemp.length > 0) {
      return shopListTemp.first;
    }
    return null;
  }
}
