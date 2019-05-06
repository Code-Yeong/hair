import 'package:hair/model/shop.dart';
import 'package:hair/utils/enum.dart';

class ShopState {
  final List<Shop> shopList;
  final LoadingStatus loadingStatus;

  ShopState({this.shopList, this.loadingStatus});

  factory ShopState.initial() {
    return ShopState(
      loadingStatus: LoadingStatus.init,
      shopList: [],
    );
  }

  ShopState copyWith({
    List<Shop> shopList,
    LoadingStatus loadingStatus,
  }) {
    return ShopState(
      shopList: shopList ?? this.shopList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
