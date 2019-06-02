import 'package:hair/model/customer.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/cus_info/cus_info_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final cusInfoReducers = combineReducers<CusInfoState>([
  new TypedReducer<CusInfoState, InitCusInfoAction>(_init),
  new TypedReducer<CusInfoState, BeginFetchCusInfoAction>(_beginFetch),
  new TypedReducer<CusInfoState, ReceivedCusInfoAction>(_received),
  new TypedReducer<CusInfoState, CusInfoLoadingErrorAction>(_errorLoading),
  new TypedReducer<CusInfoState, ReceivedAddressListAction>(_receivedAddressList),
//  new TypedReducer<CusInfoState, SelectNewAddressAction>(_editCusSelectedAddress), // 未改数据库
//  new TypedReducer<CusInfoState, EditCusGenderInfoAction>(_editCusGender),
//  new TypedReducer<CusInfoState, EditCusPhoneInfoAction>(_editCusPhone),
//  new TypedReducer<CusInfoState, EditCusAddressInfoAction>(_editCusAddress),
  new TypedReducer<CusInfoState, UpdateCusInfoSuccessAction>(_editCusInfoSuccess),
  new TypedReducer<CusInfoState, UpdateCusInfoFailedAction>(_editCusInfoFailed),
  new TypedReducer<CusInfoState, UpdateCusInfoAction>(_editCusInfo),
  new TypedReducer<CusInfoState, EditAvatarSuccessAction>(_editAvatar),
]);

CusInfoState _init(CusInfoState state, InitCusInfoAction action) {
  return state.copyWith(
    customer: null,
    commitStatus: CommitStatus.init,
    loadingStatus: LoadingStatus.init,
  );
}

CusInfoState _beginFetch(CusInfoState state, BeginFetchCusInfoAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

CusInfoState _received(CusInfoState state, ReceivedCusInfoAction action) {
  return state.copyWith(
    customer: action.customer,
    loadingStatus: LoadingStatus.success,
  );
}

CusInfoState _errorLoading(CusInfoState state, CusInfoLoadingErrorAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.failed,
  );
}

CusInfoState _receivedAddressList(CusInfoState state, ReceivedAddressListAction action) {
  print("新的地址 : ${state.customer}");
  print("新的地址集合: ${state.customer?.copyWith(addrList: action.addressList)}");
  return state.copyWith(
    customer: state.customer?.copyWith(addrList: action.addressList),
  );
}

CusInfoState _editCusInfoSuccess(CusInfoState state, UpdateCusInfoSuccessAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.success,
    customer: action.cus,
  );
}

CusInfoState _editCusInfoFailed(CusInfoState state, UpdateCusInfoFailedAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.failed,
  );
}

CusInfoState _editCusInfo(CusInfoState state, UpdateCusInfoAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.loading,
  );
}

CusInfoState _editAvatar(CusInfoState state, EditAvatarSuccessAction action) {
  Customer oldCus = state.customer;
  Customer newCus = oldCus.copyWith(avator: action.avatarUrl);
  return state.copyWith(
    customer: newCus,
  );
}

//CusInfoState _editCusSelectedAddress(CusInfoState state, SelectNewAddressAction action) {
//  return state.copyWith(
//    selectedAddress: Address(id: action.addressId, address: action.address),
//  );
//}

//CusInfoState _editCusName(CusInfoState state, EditCusNameInfoAction action) {
//  return state.copyWith(
//
//  );
//}
//
//CusInfoState _editCusGender(
//    CusInfoState state, EditCusGenderInfoAction action) {
//  return state.copyWith();
//}
//
//CusInfoState _editCusPhone(CusInfoState state, EditCusPhoneInfoAction action) {
//  return state.copyWith();
//}
//
//CusInfoState _editCusAddress(
//    CusInfoState state, EditCusAddressInfoAction action) {
//  return state.copyWith();
//}
