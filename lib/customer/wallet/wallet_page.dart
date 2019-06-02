import 'package:flutter/material.dart';
import 'package:hair/component/coupon_widget.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/component/toast.dart';
import 'package:hair/model/customer.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Customer cus = globalStore.state.cusInfoState?.customer;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          title: Text(
            '钱包',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: CommonColors.bgGray,
          elevation: 1.0,
          actions: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 18.0, bottom: 16.0),
              child: Text(
                '明细',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                alignment: Alignment.center,
                height: 200.0,
                width: double.infinity,
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '余额 ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: '${cus?.money ?? 0}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' 元',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: CouponItem(
                          title: '50元抵扣券',
                          subTitle: '满199元使用',
                          tag: '仅限北京地区',
                          status: CouponStatus.collected,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: CouponItem(
                          title: '5元抵扣券',
                          subTitle: '无门槛通用券',
                          tag: '仅限北京地区',
                          status: CouponStatus.collected,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: CouponItem(
                          title: '10元抵扣券',
                          subTitle: '满99元使用',
                          tag: '仅限北京地区',
                          status: CouponStatus.collected,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: CouponItem(
                          title: '10元抵扣券',
                          subTitle: '满99元使用',
                          tag: '仅限北京地区',
                          status: CouponStatus.collected,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.only(bottom: 10.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BottomOneButton(
                      width: 150.0,
                      title: '提现',
                      onTap: () {
                        showToast(text: '暂不支持提现');
                      },
                    ),
                    BottomOneButton(
                      width: 150.0,
                      title: '充值',
                      onTap: () {
                        showToast(text: '暂不支持充值');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
