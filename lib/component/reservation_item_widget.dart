import 'package:flutter/material.dart';
import 'package:hair/component/time_zone.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class ReservationItemWidget extends StatelessWidget {
  final String avatar;
  final String staffName;
  final String shopName;
  final String createTime;
  final OrderStatus status;
  final String serviceType;
  final String serveName;
  final String serveTime;
  final num money;
  final String comment;
  final VoidCallback onTap;

  ReservationItemWidget({
    this.avatar,
    this.staffName,
    this.shopName,
    this.serveName,
    this.serveTime,
    this.createTime,
    this.status,
    this.money,
    this.serviceType,
    this.comment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.0),
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
                  CircleAvatar(
                    backgroundImage: NetworkImage('$avatar'),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$staffName($shopName)',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${DateTimeUtils.formatTimeForStr(time: createTime)}'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${getOrderStatusText(status)}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$serveName',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '金额:¥$money 元',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '服务时间:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_buildTime(serveTime)}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _buildTime(String timeStr) {
    if (timeStr == null) {
      return '未知';
    }
    try {
      List<String> data = timeStr.split('-');
      String time = timeArea[int.parse(data[1])];
      String date = DateTimeUtils.getDayFromStr(timeInMillSecondStr: data[0]);
      return '$date $time';
    } catch (e) {
      print(e);
    }
    return '未知';
  }
}
