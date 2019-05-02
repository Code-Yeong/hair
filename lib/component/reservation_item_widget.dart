import 'package:flutter/material.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class ReservationItemWidget extends StatelessWidget {
  final String avatar;
  final String staffName;
  final String shopName;
  final String createTime;
  final OrderStatus status;
  final String serviceType;
  final double money;
  final VoidCallback onTap;

  ReservationItemWidget({
    this.avatar,
    this.staffName,
    this.shopName,
    this.createTime,
    this.status,
    this.money,
    this.serviceType,
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
                    backgroundImage: AssetImage('$avatar'),
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
                        Text('$createTime'),
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
                    '$serviceType',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '¥$money元',
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
}
