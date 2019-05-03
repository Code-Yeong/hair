import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/stars_widget.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/utils/common_colors.dart';

class ShopDetailPage extends StatelessWidget {
  final String shopName;
  final String shopId;

  ShopDetailPage({this.shopId, this.shopName});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, int>(
          converter: (store) => 9,
          builder: (context, model) {
            return Container(
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
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  right: 12.0,
                                  top: 12.0,
                                  bottom: 6.0),
                              alignment: Alignment.centerLeft,
                              height: 20.0,
                              child: Text(
                                "$shopName",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 70.0,
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  right: 12.0,
                                  top: 12.0,
                                  bottom: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.format_line_spacing),
                                      Text("4.7")
                                    ],
                                  ),
                                  Container(
                                    child: Text("236单"),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on),
                                      Text("1.3km")
                                    ],
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
                                child: BarberItem(
                                  avatar: 'assets/images/barber.jpg',
                                  name: 'Jackson',
                                  score: 3.5,
                                  orderCount: 34,
                                  onTap: () {},
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 70.0,
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                  activeColor: Colors.white,
                                ),
                                Text('上门'),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: false,
                                  onChanged: null,
                                  activeColor: Colors.white,
                                ),
                                Text('到店'),
                              ],
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
            );
          },
        ),
      ),
    );
  }
}

class BarberItem extends StatelessWidget {
  final String avatar;
  final String name;
  final double score;
  final int orderCount;
  final VoidCallback onTap;
  BarberItem({this.avatar, this.name, this.score, this.orderCount, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: CommonColors.lineDividing),
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('$avatar'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("$name",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("$orderCount单",
                          style: TextStyle(fontSize: 17.0, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      StarsWidget(
                        score: score,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 40.0,
              width: 80.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.blueAccent,
              ),
              child: Text(
                "立即预约",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
