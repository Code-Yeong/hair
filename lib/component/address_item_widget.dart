import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/utils/common_colors.dart';

typedef ItemSelected(num value);

class AddressItemWidget extends StatefulWidget {
  final String id;
  final ItemSelected onTap;
  final String username;
  final String phone;
  final String address;
  final String gender;
  final num index;
  final bool selected;

  const AddressItemWidget({Key key, this.id, this.onTap, this.username, this.phone, this.address, this.gender, this.index, this.selected}) : super(key: key);

  @override
  State createState() =>
      AddressItemWidgetState(id: id, onTap: onTap, username: username, phone: phone, address: address, gender: gender, index: index, selected: selected);
}

class AddressItemWidgetState extends State<AddressItemWidget> {
  final String id;
  final ItemSelected onTap;
  final String username;
  final String phone;
  final String address;
  final String gender;
  final num index;
  final bool selected;

  AddressItemWidgetState({this.id, this.onTap, this.username, this.phone, this.address, this.gender, this.index, this.selected});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("???"),
      onDismissed: (direction) {
        // Remove the item from our data source.
        setState(() {
//          items.removeAt(index);
        });

        // Show a snackbar! This snackbar could also contain "Undo" actions.
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("dismissed")));
//        Scaffold.of(context).showSnackBar(SnackBar(content: Text("$item dismissed")));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: CommonColors.lineDividing.withOpacity(1.0),
              width: 1.0,
            ),
          ),
        ),
        padding: EdgeInsets.only(bottom: 5.0),
        child: ListTile(
          title: Text(username + ' ' + phone),
          subtitle: Text(address),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _pushAddressEidtor(id);
            },
          ),
        ),
      ),
    );
  }

  void _pushAddressEidtor(String id) {
    GlobalNavigator.shared.pushNamed(CustomerRoute.userAddressEditPage);
  }
}
