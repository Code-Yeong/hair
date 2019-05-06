import 'package:hair/model/shop.dart';
import 'package:hair/utils/enum.dart';

class ShopState {
  final String selectedShopId; //存储在店铺列表页被选中的店铺id
  final List<Shop> shopList;
  final LoadingStatus loadingStatus;

  ShopState({this.selectedShopId, this.shopList, this.loadingStatus});

  factory ShopState.initial() {
    return ShopState(
      selectedShopId: null,
      loadingStatus: LoadingStatus.init,
      shopList: [],
    );
  }

  ShopState copyWith({
    String selectedShopId,
    List<Shop> shopList,
    LoadingStatus loadingStatus,
  }) {
    return ShopState(
      selectedShopId: selectedShopId ?? this.selectedShopId,
      shopList: shopList ?? this.shopList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
