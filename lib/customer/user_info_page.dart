import 'package:flutter/material.dart';
import 'package:hair/component/list_cell.dart';
import 'package:hair/utils/common_colors.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        title: Text(
          "个人中心",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CommonColors.bgGray,
        elevation: 1.0,
      ),
      body: Container(
        color: CommonColors.bgGray,
        child: ListView(
          children: <Widget>[
            ListCell(
              title: "姓名",
              showDivider: true,
              child: Text("张三", style: TextStyle(fontSize: 16.0)),
            ),
            ListCell(
              title: "性别",
              showDivider: true,
              child: Text("女", style: TextStyle(fontSize: 16.0)),
            ),
            ListCell(
              title: "未完成订单",
              showDivider: true,
              child: Text('6', style: TextStyle(fontSize: 16.0)),
            ),
            ListCell(
              title: "已完成订单",
              showDivider: true,
              child: Text('3', style: TextStyle(fontSize: 16.0)),
            ),
            ListCell(
              title: "地址",
              showDivider: true,
              child: Text('北京市海淀区中关村技术交易大厦', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
