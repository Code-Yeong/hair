import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/empty_widget.dart';
import 'package:hair/customer/shop/show_detail_page.dart';
import 'package:hair/model/barber.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/shop/shop_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/staff/shop/staff_shop_page_view_model.dart';
import 'package:hair/utils/common_colors.dart';

class StaffShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String bId = globalStore.state.staffInfoState.barber?.id ?? null;
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, StaffShopPageViewModel>(
          onInit: (store) {
            store.dispatch(new BeginFetchShopListAction());
          },
          converter: (store) => StaffShopPageViewModel.fromStore(store),
          builder: (context, viewModel) {
            Shop myShop = viewModel.myShop;
            return myShop != null
                ? Container(
                    color: CommonColors.bgGray,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 54.0,
                          color: Colors.blueGrey,
                          alignment: Alignment.center,
                          child: Text("我的店铺", style: TextStyle(fontSize: 20.0, color: Colors.white)),
                        ),
                        SizedBox(height: 20.0),
                        myShop == null
                            ? EmptyWidget(
                                text: "您还未加入店铺",
                              )
                            : Container(),
                        Container(
                          padding: EdgeInsets.only(top: 0.0, left: 12.0, right: 12.0),
                          child: ShopDetail(shop: myShop),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0),
//                    color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 60.0,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 30.0,
                                      child: Image.asset('assets/images/persons.png'),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        child: Text('我的同事', style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.start)),
                                    Expanded(
                                        child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('(${(myShop?.barberList?.length ?? 1) - 1}人)',
                                          style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.4)), textAlign: TextAlign.start),
                                    )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                  itemBuilder: (_, index) {
                                    Barber barber = myShop?.barberList[index];
                                    if (barber.id == bId) {
                                      return Container();
                                    }
                                    return BarberItem(
                                      batberid: barber?.id,
                                      avatar: barber?.avatar,
                                      name: barber?.name,
                                      score: barber?.score,
                                      orderCount: barber?.orderCount,
                                    );
                                  },
                                  separatorBuilder: (_, index) {
                                    Barber barber = myShop?.barberList[index];
                                    if (barber.id == bId) {
                                      return Container();
                                    }
                                    return SizedBox(
                                      height: 10.0,
                                    );
                                  },
                                  itemCount: myShop?.barberList?.length ?? 0,
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  )
                : Column(
                    children: <Widget>[
                      Container(
                        height: 54.0,
                        color: Colors.blueGrey,
                        alignment: Alignment.center,
                        child: Text("我的店铺", style: TextStyle(fontSize: 20.0, color: Colors.white)),
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: EmptyWidget(
                                text: "您还未加入店铺",
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                color: Colors.white,
                                width: 100.0,
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                child: Text(
                                  '加入店铺',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class ShopDetail extends StatelessWidget {
  final Shop shop;

  ShopDetail({this.shop});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
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
              height: 150.0,
              width: double.infinity,
//              color: Colors.red,
              padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: Column(
                children: <Widget>[
                  Container(
//                    color: Colors.red,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: shop?.avatar == null ? null : NetworkImage(shop.avatar),
                        ),
                        Text(
                          '  ${shop?.name}',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Container(
//                            color: Colors.red,
                            padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                            alignment: Alignment.centerRight,
                            child: Text("${shop?.status == 0 ? '暂停营业' : '正在营业'}",
                                style: TextStyle(fontSize: 18.0, color: Colors.green, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                child: Text('订单数:', style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.end))),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: Text('${shop?.orderCount ?? 0}',
                              style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.4)), textAlign: TextAlign.start),
                        )),
                        Expanded(child: Text('等  级:', style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.end)),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child:
                              Text('${shop?.level ?? 0}', style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.4)), textAlign: TextAlign.start),
                        )),
                        Expanded(child: Text('员工数:', style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.end)),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: Text('${shop?.barberList?.length ?? 0}',
                              style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.4)), textAlign: TextAlign.start),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: 30.0,
//                    color: Colors.red,
                    child: Row(
                      children: <Widget>[
                        Text('地址:', style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.end),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('${shop?.barberList?.length ?? 0}',
                              style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.4)), textAlign: TextAlign.start),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
