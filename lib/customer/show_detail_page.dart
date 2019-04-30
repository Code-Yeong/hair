import 'package:flutter/material.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/utils/common_colors.dart';

class ShopDetailPage extends StatelessWidget {
  final String shopName;
  final String shopId;

  ShopDetailPage({this.shopId, this.shopName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CommonColors.bgGray,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
//                  height: 150.0,
                  color: Colors.grey,
                  child: Image.asset(
                    "assets/images/shop2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 6.0),
                        alignment: Alignment.centerLeft,
                        height: 20.0,
                        child: Text(
                          "$shopName",
                          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 70.0,
                        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[Icon(Icons.format_line_spacing), Text("4.7")],
                            ),
                            Container(
                              child: Text("236单"),
                            ),
                            Row(
                              children: <Widget>[Icon(Icons.location_on), Text("1.3km")],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: BarberItem(),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 70.0,
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: BottomOneButton(
                          title: "到店",
                          disabled: false,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: BottomOneButton(
                          title: "上门",
                          disabled: false,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                top: 24.0,
                left: 8.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class BarberItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: CommonColors.lineDividing),
      ),
      child: Row(
        children: <Widget>[
          Container(
//            width: 70.0,
            height: 70.0,
            color: Colors.grey,
            child: Image.asset('assets/images/barber.jpg'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Tom", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  Text("4.2 / 32单"),
                ],
              ),
            ),
          ),
          Container(
            height: 30.0,
            width: 100.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.blueAccent,
            ),
            child: Text(
              "立即预约",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
