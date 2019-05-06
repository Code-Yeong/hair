import 'package:hair/model/shop.dart';

class ReceivedShopListAction {
  final List<Shop> shopList;
  ReceivedShopListAction({this.shopList});
}

class BeginFetchShopListAction {}
