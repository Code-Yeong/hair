import 'package:flutter/material.dart';
import 'package:hair/customer/menu_page.dart';
import 'package:hair/customer/shop_list_page.dart';
import 'package:hair/utils/common_colors.dart';

class CustomerMainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            unselectedLabelColor: Colors.grey.withOpacity(0.7),
            labelColor: Colors.blueGrey,
            indicatorColor: Colors.blueGrey,
            onTap: (index) {
              print("index:$index");
            },
            tabs: <Widget>[
              Tab(
                child: Text(
                  '门店',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '发型库',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
//          iconTheme: IconThemeData(),
          backgroundColor: CommonColors.bgGray,
          elevation: 0.5,
        ),
        body: TabBarView(children: <Widget>[
          Container(
            key: PageStorageKey("page1"),
            child: ShopListPage(),
          ),
          Container(
            key: PageStorageKey("page2"),
            child: MenuPage(),
          ),
        ]),
        backgroundColor: CommonColors.bgGray,
      ),
    );
  }
}
