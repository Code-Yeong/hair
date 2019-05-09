import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/component/time_item_widget.dart';
import 'package:hair/customer/choose_reservation_time/choose_reservation_time_view_model.dart';
import 'package:hair/customer/reservation/time_zone.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';

class ChooseReservationTimePage extends StatefulWidget {
  @override
  State createState() => _ChooseReservationTimePage();
}

class _ChooseReservationTimePage extends State<ChooseReservationTimePage> {
  String selectedItem = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData.fallback(),
            title: Text(
              "选择时间",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: CommonColors.bgGray,
            elevation: 1.0,
          ),
          body: StoreConnector<AppState, ChooseReservationTimeViewModel>(
            onInit: (store) {
              store.dispatch(new BeginFetchChooseReservationDataAction(id: store.state.chooseReservationTimeState.currentBarber.id));
            },
            converter: (store) => ChooseReservationTimeViewModel.fromStore(store),
            builder: (context, viewModel) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: CustomScrollView(
                          slivers: <Widget>[
                            SliverToBoxAdapter(
                              child: GestureDetector(
                                onTap: () {
                                  print("未实现");
                                  globalStore.dispatch(SetAddressAction(enableOnTapPop: true));
                                  GlobalNavigator.shared.pushNamed(CustomerRoute.userAddressPage);
                                },
                                child: Container(
                                    color: CommonColors.textGray.withOpacity(0.1),
                                    padding: EdgeInsets.all(10.0),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            '地址:',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                        Icon(Icons.location_on, color: Colors.red),
                                        Text(
                                          '${viewModel.defaultAddress}',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    )),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                color: CommonColors.textGray.withOpacity(0.1),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${DateTimeUtils.today()}',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                width: double.infinity,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 48.0,
                                  shrinkWrap: true,
                                  children: buildTimeItemListBlock(viewModel, 1),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                color: CommonColors.textGray.withOpacity(0.1),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${DateTimeUtils.nextOneDay()}',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                width: double.infinity,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 48.0,
                                  shrinkWrap: true,
                                  children: buildTimeItemListBlock(viewModel, 2),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                color: CommonColors.textGray.withOpacity(0.1),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${DateTimeUtils.nextTwoDay()}',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                width: double.infinity,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 48.0,
                                  shrinkWrap: true,
                                  children: buildTimeItemListBlock(viewModel, 3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      child: BottomOneButton(
                        title: '下单',
                        disabled: !viewModel.isSelectedTimeItem,
                        onTap: () {
                          selectedItem = "";
                          String cusId = globalStore.state.loginState.customer.id;
                          String barberid = viewModel.currentBarber?.id;
                          String shopId = globalStore.state.shopState.selectedShopId;
                          globalStore.dispatch(new BeginCommitReservationAction(
                            cusId: cusId,
                            barberId: barberid,
                            shopId: shopId,
                            serveTime: viewModel.selectedTime,
                            money: 35,
                            serveName: "理发",
                          ));
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  _selectedTime(int block, int timeArea) {
    if (selectedItem == "" || selectedItem != "$block-$timeArea") {
      selectedItem = "$block-$timeArea";
    } else {
      selectedItem = "";
    }
    //block表示第几天的（取值为1，2，3，1：表示今天，2、3以此类推），timerArea:第几个时间段
    //存储到数据库的时间格式为 xxxxxx-x,
    String time = "";
    if (block == 1) {
      time = "${DateTimeUtils.todayInMillSeconds()}-$timeArea";
    } else if (block == 2) {
      time = "${DateTimeUtils.nextOneDayInMillSeconds()}-$timeArea";
    }
    if (block == 3) {
      time = "${DateTimeUtils.nextTwoDayOneDayInMillSeconds()}-$timeArea";
    }
    globalStore.dispatch(new SelectedTimeItemAction(selectedTime: time));
  }

  List<Widget> buildTimeItemListBlock(ChooseReservationTimeViewModel viewModel, int block) {
    return <Widget>[
      TimeItemWidget(
        text: '10:00-12:00',
        disabled: viewModel.isReserved(block, 1),
        selected: selectedItem == '$block-1',
        onTap: () {
          if (viewModel.isReserved(block, 1)) {
            return;
          }
          _selectedTime(block, 1);
        },
      ),
      TimeItemWidget(
        text: '12:00-14:00',
        disabled: viewModel.isReserved(block, 2),
        selected: selectedItem == '$block-2',
        onTap: () {
          if (viewModel.isReserved(block, 1)) {
            return;
          }
          _selectedTime(block, 2);
        },
      ),
      TimeItemWidget(
        text: '14:00-16:00',
        disabled: viewModel.isReserved(block, 3),
        selected: selectedItem == '$block-3',
        onTap: () {
          if (viewModel.isReserved(block, 1)) {
            return;
          }
          _selectedTime(block, 3);
        },
      ),
      TimeItemWidget(
        text: '16:00-18:00',
        disabled: viewModel.isReserved(block, 4),
        selected: selectedItem == '$block-4',
        onTap: () {
          if (viewModel.isReserved(block, 1)) {
            return;
          }
          _selectedTime(block, 4);
        },
      ),
      TimeItemWidget(
        text: '18:00-20:00',
        disabled: viewModel.isReserved(block, 5),
        selected: selectedItem == '$block-5',
        onTap: () {
          if (viewModel.isReserved(block, 1)) {
            return;
          }
          _selectedTime(block, 5);
        },
      ),
    ];
  }
}
