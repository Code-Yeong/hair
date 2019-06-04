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
