import 'package:flutter/material.dart';
import 'package:hair/customer/show_detail_page.dart';
import 'package:hair/utils/common_colors.dart';

class ShopListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          title: Text(
            "附近门店",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: CommonColors.bgGray,
          elevation: 1.0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
          color: CommonColors.bgGray,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.grey),
                    Text("55楼"),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: ShopItem(
                          showName: "Shop $index",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                              return ShopDetailPage(shopName: "Shop $index");
                            }));
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  final String showName;
  final String picture;
  final VoidCallback onTap;

  ShopItem({this.showName, this.picture, this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(color: CommonColors.lineDividing),
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
//              height: 150.0,
              color: Colors.grey,
              child: Image.asset(
                "assets/images/shop2.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
              alignment: Alignment.centerLeft,
              child: Text("$showName", style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
