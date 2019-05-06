import 'package:hair/model/address.dart';
import 'package:hair/model/customer.dart';

class InitCusInfoAction {}

class BeginFetchCusInfoAction {}

class ReceivedCusInfoAction {
  final Customer customer;
  ReceivedCusInfoAction({this.customer});
}

class CusInfoLoadingErrorAction {}

class EditCusNameInfoAction {
  final String name;
  EditCusNameInfoAction({this.name});
}

class EditCusGenderInfoAction {
  final String gender;
  EditCusGenderInfoAction({this.gender});
}

class EditCusPhoneInfoAction {
  final String phone;
  EditCusPhoneInfoAction({this.phone});
}

class EditCusAddressInfoAction {
  final Address address;
  EditCusAddressInfoAction({this.address});
}

class CusAddressChangedAction {}

class ReceivedAddressListAction {
  List<Address> addressList;
  ReceivedAddressListAction({this.addressList});
}

class AddCusAddressInfoAction {
  final Address address;
  AddCusAddressInfoAction({this.address});
}
