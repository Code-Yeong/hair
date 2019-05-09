import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/reservation_item_widget.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_reservation/reservation_action.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/staff/staff_reservation_page_view_model.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class StaffReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: TabBar(
              unselectedLabelColor: Colors.white70,
              labelColor: Colors.white,
              indicatorColor: Colors.yellow,
              tabs: <Widget>[
                Tab(
                  child: Container(
                    width: 50.0,
                    child: Text(
                      '全部订单',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    '进行中',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    '已完成',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    '已取消',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.blueGrey,
            elevation: 0.5,
          ),
          body: Container(
            padding: EdgeInsets.all(12.0),
            color: CommonColors.bgGray,
            child: TabBarView(children: <Widget>[
              StoreConnector<AppState, StaffReservationPageViewModel>(
                  onInit: (store) {
                    store.dispatch(new SBeginFetchReservationListAction());
                  },
                  converter: (store) => StaffReservationPageViewModel.fromStore(store),
                  builder: (context, viewModel) {
//                    return Container(
                    return ListView.separated(
                      itemCount: viewModel.reservationList?.length,
                      itemBuilder: (context, index) {
                        Reservation reservation = viewModel.reservationList[index];
                        return ReservationItemWidget(
                          avatar: 'assets/images/barber.jpg',
                          shopName: "${viewModel.getShopName(reservation?.shopId)}",
                          staffName: "理发师${reservation?.barberId}", // TODO 解析staff name
                          status: buildOrderStatusType(int.parse(reservation.status)),
                          serviceType: "${reservation?.serviceType}",
                          serveName: "${reservation?.serveName}",
                          createTime: "${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: int.parse(reservation?.money),
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
              // Tab :进行中
              StoreConnector<AppState, StaffReservationPageViewModel>(
                  onInit: (store) {
                    store.dispatch(new BeginFetchReservationListAction());
                  },
                  converter: (store) => StaffReservationPageViewModel.fromStore(store),
                  builder: (context, viewModel) {
                    List<Reservation> reservationList = viewModel.getCommentingList();
                    return ListView.separated(
                      itemCount: reservationList?.length,
                      itemBuilder: (context, index) {
                        Reservation reservation = reservationList[index];

                        ///这里只传参数，不拼接字符串，需要修改
                        return ReservationItemWidget(
                          avatar: 'assets/images/barber.jpg',
                          shopName: "${viewModel.getShopName(reservation?.shopId)}",
                          staffName: "理发师${reservation?.barberId}", // TODO 解析staff name
                          status: buildOrderStatusType(int.parse(reservation.status)),
                          serviceType: "${reservation?.serviceType}",
                          serveName: "${reservation?.serveName}",
                          createTime: "${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: int.parse(reservation?.money),
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
              // Tab :已完成
              StoreConnector<AppState, StaffReservationPageViewModel>(
                  onInit: (store) {
                    store.dispatch(new BeginFetchReservationListAction());
                  },
                  converter: (store) => StaffReservationPageViewModel.fromStore(store),
                  builder: (context, viewModel) {
                    List<Reservation> reservationList = viewModel.getCommentingList();
                    return ListView.separated(
                      itemCount: reservationList?.length,
                      itemBuilder: (context, index) {
                        Reservation reservation = reservationList[index];

                        ///这里只传参数，不拼接字符串，需要修改
                        return ReservationItemWidget(
                          avatar: 'assets/images/barber.jpg',
                          shopName: "${viewModel.getShopName(reservation?.shopId)}",
                          staffName: "理发师${reservation?.barberId}", // TODO 解析staff name
                          status: buildOrderStatusType(int.parse(reservation.status)),
                          serviceType: "${reservation?.serviceType}",
                          serveName: "${reservation?.serveName}",
                          createTime: "${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: int.parse(reservation?.money),
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
              StoreConnector<AppState, StaffReservationPageViewModel>(
                  onInit: (store) {
                    store.dispatch(new BeginFetchReservationListAction());
                  },
                  converter: (store) => StaffReservationPageViewModel.fromStore(store),
                  builder: (context, viewModel) {
                    List<Reservation> reservationList = viewModel.getCanceledList();
                    return ListView.separated(
                      itemCount: reservationList?.length,
                      itemBuilder: (context, index) {
                        Reservation reservation = reservationList[index];

                        ///这里只传参数，不拼接字符串，需要修改
                        return ReservationItemWidget(
                          avatar: 'assets/images/barber.jpg',
                          shopName: "${viewModel.getShopName(reservation?.shopId)}",
                          staffName: "理发师${reservation?.barberId}", // TODO 解析staff name
                          status: buildOrderStatusType(int.parse(reservation.status)),
                          serviceType: "${reservation?.serviceType}",
                          serveName: "${reservation?.serveName}",
                          createTime: "${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: int.parse(reservation?.money),
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
