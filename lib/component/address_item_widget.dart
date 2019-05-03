import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';

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

  AddressItemWidget({
    this.id,
    this.onTap,
    this.username,
    this.phone,
    this.address,
    this.gender,
    this.index,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(username + ' ' + phone),
      subtitle: Text(address),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          _pushAddressEidtor(id);
        },
      ),
    );
  }

  void _pushAddressEidtor(String id) {
    GlobalNavigator.shared.pushNamed(CustomerRoute.userAddressEditPage);
  }
}
