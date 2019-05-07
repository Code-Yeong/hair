import 'package:hair/model/shop.dart';
import 'package:hair/utils/enum.dart';

class BarberState {
  final String selectedShopId; //存储在店铺列表页被选中的店铺id
  final List<Shop> shopList;
  final LoadingStatus loadingStatus;

  BarberState({this.selectedShopId, this.shopList, this.loadingStatus});

  factory BarberState.initial() {
    return BarberState(
      selectedShopId: null,
      loadingStatus: LoadingStatus.init,
      shopList: [],
    );
  }

  BarberState copyWith({
    String selectedShopId,
    List<Shop> shopList,
    LoadingStatus loadingStatus,
  }) {
    return BarberState(
      selectedShopId: selectedShopId ?? this.selectedShopId,
      shopList: shopList ?? this.shopList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
