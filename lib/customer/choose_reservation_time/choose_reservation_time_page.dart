import 'package:flutter/material.dart';
import 'package:hair/utils/common_colors.dart';

class ChooseReservationTimePage extends StatefulWidget {
  @override
  State createState() => _ChooseReservationTimePage();
}

class _ChooseReservationTimePage extends State<ChooseReservationTimePage> {
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
        body: Container(
            child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                color: CommonColors.textGray.withOpacity(0.1),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '5月4日 星期三',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      height: 20.0,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('10:00 - 11:59'),
                    ),
                    Container(
                      height: 20.0,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text('11:59 - 13:59'),
                    ),
                    Container(
                      height: 20.0,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text('14:00 - 15:59'),
                    ),
                    Container(
                      height: 20.0,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text('16:00 - 17:59'),
                    ),
                    Container(
                      height: 20.0,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text('18:00 - 19:59'),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: CommonColors.textGray.withOpacity(0.1),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '5月5日 星期三',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: CommonColors.textGray.withOpacity(0.1),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '5月6日 星期三',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
