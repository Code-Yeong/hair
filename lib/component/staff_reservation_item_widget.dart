import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/customer/reservation/time_zone.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class StaffReservationItemWidget extends StatelessWidget {
  final String resId;
  final String cusName;
  final OrderStatus status;
  final String address;
  final String serviceType;
  final String serveName;
  final String serveTime;
  final VoidCallback onTap;

  StaffReservationItemWidget({
    this.resId,
    this.cusName,
    this.status,
    this.address,
    this.serviceType,
    this.serveName,
    this.serveTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 20.0, bottom: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(color: CommonColors.lineDividing),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 80.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$cusName',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('  - $address', style: TextStyle(color: Colors.black26)),
                        Text('  - $serviceType', style: TextStyle(color: Colors.black26)),
                        Text('  - $serveName', style: TextStyle(color: Colors.black26)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 3.0, right: 10.0),
                      alignment: Alignment.topRight,
                      child: Text(
                        '${getStaffOrderStatusText(status)}',
                        style: TextStyle(
                          color: getColorFromOrderStatus(status),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
                child: Text(
                  '${formatTime(serveTime)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: showButton(status)
                    ? GestureDetector(
                        onTap: () {
                          if (status == OrderStatus.waiting) {
                            globalStore.dispatch(SBeginEditReservationStatusAction(status: '2', resId: resId));
                          } else if (status == OrderStatus.processing) {
                            print("跳转服务流程页面");
                            globalStore.dispatch(new SSelectedReservationAction(rId: resId));
                            GlobalNavigator.shared.pushNamed(StaffRoute.staffReservationDetailPage);
//                            GlobalNavigator.shared.pushNamed(StaffRoute.reservationDetailPage);
//                            globalStore.dispatch(SBeginEditReservationStatusAction(status: '3'));
                          }
                        },
                        child: Container(
                          width: 70.0,
                          height: 30.0,
                          color: getColorFromOrderStatus(status),
                          alignment: Alignment.center,
                          child: Text(getButtonText(status), style: TextStyle(fontSize: 16.0, color: Colors.white)),
                        ),
                      )
                    : Container(),
              )
            ])
          ],
        ),
      ),
    );
  }

  String formatTime(String str) {
    if (str == null) {
      return '';
    }
    List<String> arr = str.split("-");
    String date = DateTimeUtils.formatTimeForStr(time: arr[0]).substring(5, 11);
    String time = timeArea[int.parse(arr[1]) - 1];
    return "$date $time";
  }

  Color getColorFromOrderStatus(OrderStatus status) {
    Color color;
    switch (status) {
      case OrderStatus.waiting:
        color = Colors.blueAccent;
        break;
      case OrderStatus.processing:
        color = Colors.deepOrange;
        break;
      default:
        color = Colors.black26;
    }
    return color;
  }

  String getButtonText(OrderStatus status) {
    String text;
    switch (status) {
      case OrderStatus.waiting:
        text = "接单";
        break;
      case OrderStatus.processing:
        text = "服务";
        break;
      default:
        text = '';
    }
    return text;
  }

  bool showButton(OrderStatus status) {
    return status == OrderStatus.waiting || status == OrderStatus.processing;
  }

  String getStaffOrderStatusText(OrderStatus status) {
    if (status == OrderStatus.commenting || status == OrderStatus.commented) return '已完成';
    return getOrderStatusText(status);
  }
}
