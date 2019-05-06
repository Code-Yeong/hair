import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/customer/shop/shop_list_page_view_model.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/shop/shop_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';

class ShopListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build");
    return SafeArea(
      child: Scaffold(
//        appBar: AppBar(
//          iconTheme: IconThemeData.fallback(),
//          title: Text(
//            "附近门店",
//            style: TextStyle(color: Colors.black),
//          ),
//          backgroundColor: CommonColors.bgGray,
//          elevation: 1.0,
//        ),
        body: StoreConnector<AppState, ShopListPageViewModel>(
          onInit: (store) {
            store.dispatch(new BeginFetchShopListAction());
          },
          converter: (store) => ShopListPageViewModel.fromStore(store),
          builder: (context, viewModel) {
            return Container(
              padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
              color: CommonColors.bgGray,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.location_on, color: Colors.grey),
                        Text("55楼"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.shopList.length,
                      itemBuilder: (context, index) {
                        Shop shop = viewModel.shopList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: ShopItem(
                            showName: "${shop.name}",
                            picture: "${shop.avatar}",
                            status: shop.status,
                            onTap: () {
                              globalStore.dispatch(new SelectedShopAction(id: shop?.id));
                              GlobalNavigator.shared.pushNamed(CustomerRoute.showShopDetailPage);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  final String showName;
  final String picture;
  final num status;
  final VoidCallback onTap;

  ShopItem({this.showName, this.picture, this.status, this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(color: CommonColors.lineDividing),
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
//              height: 150.0,
              color: Colors.grey,
//              child: Image.asset(
//                "assets/images/shop2.jpg",
//                fit: BoxFit.cover,
//              ),
              child: Image.network(picture),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 50.0,
                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                  alignment: Alignment.centerLeft,
                  child: Text("$showName", style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 50.0,
                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                  alignment: Alignment.centerLeft,
                  child: Text("${status == 0 ? '暂停营业' : '正在营业'}", style: TextStyle(fontSize: 18.0, color: Colors.green, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
