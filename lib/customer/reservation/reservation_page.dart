import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/empty_widget.dart';
import 'package:hair/component/reservation_item_widget.dart';
import 'package:hair/customer/reservation/reservation_page_view_model.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_reservation/reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: TabBar(
              unselectedLabelColor: Colors.grey.withOpacity(0.7),
              labelColor: Colors.blueGrey,
              indicatorColor: Colors.blueGrey,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    '全部订单',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    '待评价',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    '已取消',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: CommonColors.bgGray,
            elevation: 0.5,
          ),
          body: Container(
            padding: EdgeInsets.all(12.0),
            color: CommonColors.bgGray,
            child: TabBarView(children: <Widget>[
              StoreConnector<AppState, ReservationPageViewModel>(
                  onInit: (store) {
                    store.dispatch(new BeginFetchReservationListAction());
                  },
                  converter: (store) => ReservationPageViewModel.fromStore(store),
                  builder: (context, viewModel) {
//                    return Container(
                    if (viewModel.reservationList?.length == 0) {
                      return EmptyWidget(
                        text: "没有订单哦",
                      );
                    }
                    return ListView.separated(
                      itemCount: viewModel.reservationList?.length,
                      itemBuilder: (context, index) {
                        Reservation reservation = viewModel.reservationList[index];

                        ///这里只传参数，不拼接字符串，需要修改
                        return ReservationItemWidget(
                          avatar: reservation?.avatar,
                          shopName: viewModel.getShopName(reservation?.shopId),
                          staffName: reservation?.staffName,
                          status: buildOrderStatusType(int.parse(reservation.status)), //???
                          serviceType: "内容:${reservation?.serviceType}",
                          serveName: "内容:${reservation?.serveName}",
                          createTime: "${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: int.parse(reservation?.money),
                          comment: reservation?.comment,
                          onTap: () {
                            globalStore.dispatch(new SelectedReservationAction(rId: reservation?.rId));
                            GlobalNavigator.shared.pushNamed(CustomerRoute.reservationDetailPage);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.0,
                        );
                      },
                    );
                  }),
              // Tab :待评价
              StoreConnector<AppState, ReservationPageViewModel>(
                  onInit: (store) {
                    store.dispatch(new BeginFetchReservationListAction());
                  },
                  converter: (store) => ReservationPageViewModel.fromStore(store),
                  builder: (context, viewModel) {
                    List<Reservation> reservationList = viewModel.getCommentingList();
                    if (reservationList.length == 0) {
                      return EmptyWidget(
                        text: "没有订单哦",
                      );
                    }
                    return ListView.separated(
                      itemCount: reservationList?.length,
                      itemBuilder: (context, index) {
                        Reservation reservation = reservationList[index];
                        return ReservationItemWidget(
                          avatar: reservation?.avatar,
                          shopName: viewModel.getShopName(reservation?.shopId),
                          staffName: reservation?.staffName,
                          status: buildOrderStatusType(int.parse(reservation.status)), //???
                          serviceType: "内容:${reservation?.serviceType}",
                          serveName: "内容:${reservation?.serveName}",
                          createTime: "${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: int.parse(reservation?.money),
                          comment: reservation?.comment,
                          onTap: () {
                            globalStore.dispatch(new SelectedReservationAction(rId: reservation?.rId));
                            GlobalNavigator.shared.pushNamed(CustomerRoute.reservationDetailPage);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.0,
                        );
                      },
                    );
                  }),

              // Tab :已取消
              StoreConnector<AppState, ReservationPageViewModel>(
                  onInit: (store) {
                    store.dispatch(new BeginFetchReservationListAction());
                  },
                  converter: (store) => ReservationPageViewModel.fromStore(store),
                  builder: (context, viewModel) {
                    List<Reservation> reservationList = viewModel.getCanceledList();
                    if (reservationList?.length == null || reservationList?.length == 0) {
                      return EmptyWidget(
                        text: "没有订单哦",
                      );
                    }
                    return ListView.separated(
                      itemCount: reservationList?.length ?? 0,
                      itemBuilder: (context, index) {
                        Reservation reservation = reservationList[index];
                        return ReservationItemWidget(
                          avatar: reservation?.avatar,
                          shopName: viewModel.getShopName(reservation?.shopId),
                          staffName: reservation?.staffName,
                          status: buildOrderStatusType(int.parse(reservation.status)), //???
                          serviceType: "内容:${reservation?.serviceType}",
                          serveName: "内容:${reservation?.serveName}",
                          createTime: "${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: int.parse(reservation?.money),
                          comment: reservation?.comment,
                          onTap: () {
                            globalStore.dispatch(new SelectedReservationAction(rId: reservation?.rId));
                            GlobalNavigator.shared.pushNamed(CustomerRoute.reservationDetailPage);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.0,
                        );
                      },
                    );
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
