import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/staff_info/staff_info_action.dart';
import 'package:hair/redux/staff_info/staff_info_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final staffInfoReducers = combineReducers<StaffInfoState>([
  new TypedReducer<StaffInfoState, InitStaffInfoAction>(_init),
  new TypedReducer<StaffInfoState, BeginFetchStaffInfoAction>(_beginFetch),
  new TypedReducer<StaffInfoState, ReceivedStaffInfoAction>(_received),
  new TypedReducer<StaffInfoState, StaffInfoLoadingErrorAction>(_errorLoading),
  new TypedReducer<StaffInfoState, BeginVerifyAction>(_beginVerify),
  new TypedReducer<StaffInfoState, VerifySuccessAction>(_verifySuccess),
  new TypedReducer<StaffInfoState, VerifyFailedAction>(_verifyFailed),
//  new TypedReducer<StaffInfoState, EditStaffGenderInfoAction>(_editStaffGender),
//  new TypedReducer<StaffInfoState, EditStaffPhoneInfoAction>(_editStaffPhone),
//  new TypedReducer<StaffInfoState, EditStaffAddressInfoAction>(_editStaffAddress),
]);

StaffInfoState _init(StaffInfoState state, InitStaffInfoAction action) {
  return state.copyWith(
    barber: null,
    commitStatus: CommitStatus.init,
    loadingStatus: LoadingStatus.init,
  );
}

StaffInfoState _beginFetch(StaffInfoState state, BeginFetchStaffInfoAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

StaffInfoState _received(StaffInfoState state, ReceivedStaffInfoAction action) {
  return state.copyWith(
    barber: action.staff,
    loadingStatus: LoadingStatus.success,
  );
}

StaffInfoState _errorLoading(StaffInfoState state, StaffInfoLoadingErrorAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.failed,
  );
}

//StaffInfoState _editStaffSelectedAddress(StaffInfoState state, SelectNewAddressAction action) {
//  return state.copyWith(
//    selectedAddress: Address(id: action.addressId, address: action.address),
//  );
//}

//StaffInfoState _editStaffName(StaffInfoState state, EditStaffNameInfoAction action) {
//  return state.copyWith(
//
//  );
//}
//
//StaffInfoState _editStaffGender(
//    StaffInfoState state, EditStaffGenderInfoAction action) {
//  return state.copyWith();
//}
//
//StaffInfoState _editStaffPhone(StaffInfoState state, EditStaffPhoneInfoAction action) {
//  return state.copyWith();
//}
//
//StaffInfoState _editStaffAddress(
//    StaffInfoState state, EditStaffAddressInfoAction action) {
//  return state.copyWith();
//}

StaffInfoState _verifySuccess(StaffInfoState state, VerifySuccessAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.success, barber: action.barber);
}

StaffInfoState _verifyFailed(StaffInfoState state, VerifyFailedAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.failed);
}

StaffInfoState _beginVerify(StaffInfoState state, BeginVerifyAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}
