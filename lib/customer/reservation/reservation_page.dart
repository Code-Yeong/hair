import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/reservation_item_widget.dart';
import 'package:hair/customer/reservation/reservation_page_view_model.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_reservation/reservation_action.dart';
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
                    '退款',
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
                    return ListView.separated(
                      itemCount: viewModel.reservationList?.length,
                      itemBuilder: (context, index) {
                        Reservation reservation = viewModel.reservationList[index];
                        return ReservationItemWidget(
                          avatar: 'assets/images/barber.jpg',
                          shopName: "店铺:${reservation?.shopId}",
                          staffName: "理发师:${reservation?.staffName}",
                          status: OrderStatus.commenting, //???
                          serviceType: "内容:${reservation?.serviceType}",
                          createTime: "创建时间:${reservation?.createTime}", //'2019年5月2日 10:00-12:00'
                          money: 35,
                          onTap: () {
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
              Container(),
              Container(),
            ]),
          ),
        ),
      ),
    );
  }
}
