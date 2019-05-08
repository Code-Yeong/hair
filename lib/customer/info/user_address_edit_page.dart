import 'package:flutter/material.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/model/address.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';

class UserAddressEditPage extends StatefulWidget {
  final String id;
  final String status; // 1 普通地址 2 选中地址
  final String name;
  final String phone;
  final String address;
  final String description;
  final bool addPage; // 判断页面类型为addPage，editPage
  bool selected;

  UserAddressEditPage({this.id, @required this.addPage, this.status, this.name, this.phone, this.address, this.description = '', this.selected = false});

  @override
  State<StatefulWidget> createState() => UserAddressEditPageState();
}

class UserAddressEditPageState extends State<UserAddressEditPage> {
//  final Address address;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerName = TextEditingController(text: widget.name);
    final TextEditingController _controllerPhone = TextEditingController(text: widget.phone);
    final TextEditingController _controllerAddress = TextEditingController(text: widget.address);
    final TextEditingController _controllerDescription = TextEditingController(text: widget.description);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        title: Text(
          "收货地址",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CommonColors.bgGray,
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: CommonColors.bgGray,
        child: Column(children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('联系人',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextFormField(
                        decoration: new InputDecoration.collapsed(hintText: '姓名'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                        controller: _controllerName,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('电话',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextFormField(
//                        initialValue: phone,
                        controller: _controllerPhone,
                        decoration: new InputDecoration.collapsed(hintText: '手机号码'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('地址',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextFormField(
//                        initialValue: address,
                        controller: _controllerAddress,
                        decoration: new InputDecoration.collapsed(hintText: '上门服务地址'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('补充说明',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextFormField(
//                        initialValue: description,
                        controller: _controllerDescription,
                        decoration: new InputDecoration.collapsed(hintText: '备注'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
//                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 100.0),
                child: Container(
                  height: 40.0,
                  width: 50.0,
                  child: Row(children: <Widget>[
                    Checkbox(
                        value: widget.selected,
                        onChanged: (value) {
                          setState(() {
                            print("！！！！！！！！！！！！2 Checkbox： ${widget.selected}");
                            widget.selected = !widget.selected;
                            print("！！！！！！！！！！！！2 Checkbox： ${widget.selected}");
                          });
                        }),
                    Text(
                      '选为默认地址',
                      style: TextStyle(
                        color: widget.selected ? Colors.black : Colors.black26,
                        fontSize: 16.0,
                      ),
                    )
                  ]),
//                  decoration: BoxDecoration(
//                    color: status == '2' ? Colors.blueGrey : Colors.white,
//                    border: Border(
//                      bottom: BorderSide(
//                        color: CommonColors.lineDividing.withOpacity(1.0),
//                        width: 1.0,
//                      ),
//                    ),
//                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 15.0,
              right: 20.0,
              left: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BottomOneButton(
                  width: widget.addPage ? 300.0 : 150.0,
                  title: '确定',
                  onTap: () {
//                print("修改地址页面 id=$id");
                    if (widget.id != null) {
                      globalStore.dispatch(new EditCusAddressInfoAction(
                          address: Address(
                        id: widget.id,
                        cusId: globalStore.state.loginState?.customer?.id,
                        status: widget.selected ? '2' : '1',
                        name: _controllerName.text,
                        phone: _controllerPhone.text,
                        address: _controllerAddress.text,
                        description: _controllerDescription.text,
                      )));
                    } else {
                      globalStore.dispatch(new AddCusAddressInfoAction(
                        address: Address(
                          status: widget.selected ? '2' : '1',
                          name: _controllerName.text,
                          phone: _controllerPhone.text,
                          address: _controllerAddress.text,
                          description: _controllerDescription.text,
                        ),
                      ));
                    }
                  },
                ),
                widget.addPage
                    ? Container()
                    : Container(
                        width: 10.0,
                      ),
                widget.addPage
                    ? Container()
                    : BottomOneButton(
                        width: 150.0,
                        title: '删除',
                        bgColor: Colors.redAccent,
                        onTap: () {
                          globalStore.dispatch(RemoveCusAddressInfoAction(addressId: widget.id));
                        },
                      ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
