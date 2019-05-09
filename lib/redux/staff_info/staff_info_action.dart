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
