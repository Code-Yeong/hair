import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hair/customer/info/user_address_edit_page.dart';
import 'package:hair/utils/common_colors.dart';

typedef ItemSelected(num value);

class AddressItemWidget extends StatelessWidget {
  final String id;
  final ItemSelected onTap;
  final String username;
  final String phone;
  final String address;
  final String gender;
  final num index;
  final bool selected;

  AddressItemWidget({this.id, this.onTap, this.username, this.phone, this.address, this.gender, this.index, this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.blueGrey : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: CommonColors.lineDividing.withOpacity(1.0),
            width: 1.0,
          ),
        ),
      ),
      padding: EdgeInsets.only(bottom: 5.0),
      child: ListTile(
        title: Row(children: <Widget>[
          Text(
            username + ' ',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            phone,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ]),
        subtitle: Text(
          address,
          style: TextStyle(color: selected ? Colors.white : Colors.grey),
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            _pushAddressEidtor(id, context);
          },
        ),
      ),
    );
  }

  void _pushAddressEidtor(String index, BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => UserAddressEditPage(
              addPage: false,
              id: id,
              status: selected ? '2' : '1', //???
              name: username,
              phone: phone,
              address: address,
              selected: selected,
            ),
      ),
    );
  }
}
