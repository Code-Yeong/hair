import 'dart:io';

import 'package:hair/model/barber.dart';

class InitStaffInfoAction {}

class BeginFetchStaffInfoAction {}

class ReceivedStaffInfoAction {
  final Barber staff;
  ReceivedStaffInfoAction({this.staff});
}

class StaffInfoLoadingErrorAction {}

class EditStaffNameInfoAction {
  final String name;
  EditStaffNameInfoAction({this.name});
}

class EditStaffGenderInfoAction {
  final String gender;
  EditStaffGenderInfoAction({this.gender});
}

class EditStaffPhoneInfoAction {
  final String phone;
  EditStaffPhoneInfoAction({this.phone});
}

//理发师认证
class BeginVerifyAction {
  final String name;
  final String idCard;
  final File certificate;

  BeginVerifyAction({this.name, this.idCard, this.certificate});
}

class VerifySuccessAction {
  Barber barber;
  VerifySuccessAction({this.barber});
}

class VerifyFailedAction {}

enum HandleType {
  cancel,
  apply,
}

//申请/取消加入店铺
class BeginOrCancelApplyShop {
  String shopId; //店铺Id
  String bid; //理发师id
  HandleType handleType;
  BeginOrCancelApplyShop({this.shopId, this.bid, this.handleType});
}

//申请提交成功，等待审核
class ApplyShopFinishedAction {
  HandleType handleType;
  ApplyShopFinishedAction({this.handleType});
}

//申请提交成功，等待审核
class ApplyShopFailedAction {
  HandleType handleType;
  ApplyShopFailedAction({this.handleType});
}
