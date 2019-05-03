import 'package:flutter/material.dart';
import 'package:hair/component/menu_button1.dart';
import 'package:hair/component/menu_hairview_list.dart';
import 'package:hair/model/menu_view_item.dart';
import 'package:hair/utils/common_colors.dart';

class MenuPage extends StatefulWidget {
  @override
  State createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final leftLists = ['剪发', '染烫', '化妆'];
  final rightTopLists = ['全部', '男', '女', '刘海', '儿童'];
  final List<MenuViewItem> rightViewLists = MenuViewItem.getList();
  num leftSelectedIndex = 0;
  num rightTopSelectedIndex = 0;
  num rightViewSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          title: Text(
            "造型库",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: CommonColors.bgGray,
          elevation: 1.0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 5.0, left: 0.0, right: 0.0),
          color: CommonColors.bgGray,
          child: Row(
            children: <Widget>[
              Container(
                width: 65.0,
                child: Column(
                  children: _buildLeftList(),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        child: Row(
                          children: _buildRightTopList(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // TODO: GridView.count
                          height: double.infinity,
                          child: GridView.count(
                            crossAxisCount: 2,
                            children: _buildRightViewList(),
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLeftList() {
    return leftLists.map((obj) {
      num currentIndex = leftLists.indexOf(obj);
      return Container(
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(35.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
          child: MenuButton1(
            index: currentIndex,
            title: obj,
            activatedTextColor: Colors.white,
            selected: leftSelectedIndex == currentIndex,
            onTap: (index) {
              leftSelectedIndex = index;
              setState(() {});
            },
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildRightTopList() {
    return rightTopLists.map((obj) {
      num currentIndex = rightTopLists.indexOf(obj);
      return Container(
        padding: EdgeInsets.all(3.0),
        width: 62.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(31.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(31.0)),
          child: MenuButton1(
            index: currentIndex,
            title: obj,
            defaultTextColor: Colors.black26,
            activatedColor: CommonColors.bgGray,
            activatedTextColor: Colors.blue,
            selected: rightTopSelectedIndex == currentIndex,
            onTap: (index) {
              rightTopSelectedIndex = index;
              setState(() {});
            },
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildRightViewList() {
    return rightViewLists.map((data) {
      return MenuHairViewList(
        title: data.title,
        subtitle: data.subtitle,
        tag: data.tag,
        imgUrl: data.imgUrl,
        onTap: (index) {
          print('clicked item ${data.title}');
        },
      );
    }).toList();
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
              child: Text("$showName",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
