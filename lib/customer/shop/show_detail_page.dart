import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/barber_comment_page/barber_comment_page.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/empty_widget.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/component/stars_widget.dart';
import 'package:hair/customer/shop/shop_list_page_view_model.dart';
import 'package:hair/model/barber.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/shop/shop_action.dart';
import 'package:hair/redux/staff_info/staff_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class ShopDetailPage extends StatelessWidget {
  final String shopName;
  final String shopId;

  ShopDetailPage({this.shopId, this.shopName});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, ShopListPageViewModel>(
          onInit: (store) {
            store.dispatch(new BeginFetchShopDetailAction());
          },
          converter: (store) => ShopListPageViewModel.fromStore(store),
          builder: (context, model) {
//            print('selectedShop:${model.selectedShop.toString()}');
            Role role = globalStore.state.loginState.role;
            print('role:$role');
            Barber barber = globalStore.state.staffInfoState?.barber;
            Shop shop = model.selectedShop;
            return Container(
              color: CommonColors.bgGray,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(minHeight: 200.0),
                        color: Colors.grey.withOpacity(0.4),
                        child: model.selectedShop?.avatar == null ? null : Image.network(model.selectedShop?.avatar ?? ""),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 6.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${shop?.name ?? '未命名'}",
                                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 70.0,
                              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "${shop?.score ?? 0}分",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.face,
                                        color: Colors.brown,
                                      ),
                                      Container(
                                        child: Text(
                                          "${shop?.orderCount ?? 0}单",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        "1.3km",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: shop?.barberList?.length == 0
                            ? EmptyWidget(
                                text: "员工都离开了",
                              )
                            : Container(
                                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                                child: ListView.builder(
                                  itemCount: shop?.barberList?.length ?? 0,
                                  itemBuilder: (_, index) {
                                    Barber barber = shop.barberList[index];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 20.0),
                                      child: BarberItem(
                                        batberid: barber?.id,
                                        avatar: barber?.avatar,
                                        name: barber?.name,
                                        score: barber?.score,
                                        shopAvatar: shop.avatar,
                                        orderCount: barber?.orderCount,
                                        onTap: role == Role.customer
                                            ? () {
                                                globalStore.dispatch(new SetCurrentBarberAction(barber: barber));
                                                GlobalNavigator.shared.pushNamed(CustomerRoute.chooseReservationTimePage);
                                              }
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
                      role == Role.customer
                          ? Container(
                              height: 70.0,
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: true,
                                        onChanged: null,
                                        activeColor: Colors.white,
                                      ),
                                      Text('洗剪吹'),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: false,
                                        onChanged: null,
                                        activeColor: Colors.white,
                                      ),
                                      Text('烫染'),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(12.0),
                              child: BottomOneButton(
                                disabled: barber.shopStatus != "0",
                                title: barber.shopStatus == "0" ? '申请加入${barber.shopStatus}' : "等待审核${barber.shopStatus}",
                                onTap: () {
                                  if (barber.shopStatus == "0") {
                                    //申请加入
                                    globalStore.dispatch(BeginOrCancelApplyShop(bid: barber?.id, shopId: shop.id, handleType: HandleType.apply));
                                  } else {
                                    //取消申请
                                    globalStore.dispatch(BeginOrCancelApplyShop(bid: barber?.id, shopId: shop.id, handleType: HandleType.cancel));
                                  }
                                },
                              ),
                            )
                    ],
                  ),
                  Positioned(
                      top: 24.0,
                      left: 8.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BarberItem extends StatelessWidget {
  final String batberid;
  final String avatar;
  final String name;
  final String shopAvatar;
  final num score;
  final num orderCount;
  final VoidCallback onTap;
  BarberItem({this.batberid, this.avatar, this.name, this.score, this.orderCount, this.shopAvatar, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: CommonColors.lineDividing),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return BarberCommentPage(
                barberId: batberid,
                barberAvatar: avatar,
                barberName: name,
                shopAvatar: shopAvatar,
              );
            }),
          );
        },
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('$avatar'),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("$name", style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold)),
//                      SizedBox(
//                        width: 10.0,
//                      ),
//                      Text("$orderCount单", style: TextStyle(fontSize: 17.0, color: Colors.grey)),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        StarsWidget(
                          score: score,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            onTap != null
                ? GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 40.0,
                      width: 80.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: Colors.blueAccent,
                      ),
                      child: Text(
                        "立即预约",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
