import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/staff_dialog.dart';
import 'package:hair/component/time_zone.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class StaffReservationItemWidget extends StatefulWidget {
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
  State createState() => StaffReservationItemState();
}

class StaffReservationItemState extends State<StaffReservationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.2),
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
                          '${widget.cusName}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('  - ${widget.address}', style: TextStyle(color: Colors.black26)),
                        Text('  - ${widget.serviceType}', style: TextStyle(color: Colors.black26)),
                        Text('  - ${widget.serveName}', style: TextStyle(color: Colors.black26)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 3.0, right: 10.0),
                      alignment: Alignment.topRight,
                      child: Text(
                        '${getStaffOrderStatusText(widget.status)}',
                        style: TextStyle(
                          color: getColorFromOrderStatus(widget.status),
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
                  '${formatTime(widget.serveTime)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: showButton(widget.status)
                    ? GestureDetector(
                        onTap: () {
                          if (widget.status == OrderStatus.waiting) {
                            globalStore.dispatch(SBeginEditReservationStatusAction(status: '2', resId: widget.resId));
                          } else if (widget.status == OrderStatus.processing) {
//                            globalStore.dispatch(new SSelectedReservationAction(rId: widget.resId));
//                            GlobalNavigator.shared.pushNamed(StaffRoute.staffReservationDetailPage);
//                            GlobalNavigator.shared.pushNamed(StaffRoute.reservationDetailPage);
                            if (globalStore.state.sReservationState.findById(widget.resId)?.verified == '0') {
                              showDialog(
                                context: context,
                                builder: (_) => PPBDialog(
                                      resId: widget.resId,
                                      title: Text('请输入服务码', textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
                                      description: Text(
                                        '未到达指定地址前，请勿向客户索要服务码',
//                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                              );
                            } else if (globalStore.state.sReservationState.findById(widget.resId)?.verified == '1') {
                              print("服务码已验证,跳转服务流程页面");
                              globalStore.dispatch(new SSelectedReservationAction(rId: widget.resId));
                              GlobalNavigator.shared.pushNamed(StaffRoute.qrPage);
                            } else {
                              print('判断条件有问题:${widget.resId}');
                              print('判断条件有问题:${globalStore.state.sReservationState.findById(widget.resId)}');
                            }

//
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            color: getColorFromOrderStatus(widget.status),
                          ),
                          width: 70.0,
                          height: 30.0,
                          alignment: Alignment.center,
                          child: Text(getButtonText(widget.status), style: TextStyle(fontSize: 16.0, color: Colors.white)),
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
      case OrderStatus.commenting:
      case OrderStatus.commented:
        color = Colors.green;
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
