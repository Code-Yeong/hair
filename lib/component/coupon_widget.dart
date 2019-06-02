import 'package:flutter/material.dart';
import 'package:hair/component/dash_line.dart';
import 'package:hair/utils/enum.dart';

//优惠券条目
class CouponItem extends StatelessWidget {
  final CouponStatus status;
  final String title;
  final String subTitle;
  final String tag;

  CouponItem({this.status, this.title, this.subTitle, this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '$title',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '$subTitle',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16.0),
                    height: 30.0,
                    child: Text(
                      '*$tag',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100.0,
            width: 10.0,
            child: DashLine(
              width: 1.0,
              height: 10.0,
              color: Colors.black.withOpacity(0.3),
              direction: LineDirection.vertical,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0,
            child: Text(
              '${getCouponStatusText(status)}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red.withOpacity(0.7),
              ),
            ),
          )
        ],
      ),
    );
  }
}
