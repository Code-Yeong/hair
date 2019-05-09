import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/staff_reservation/s_reservation_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final sReservationReducers = combineReducers<SReservationState>([
  new TypedReducer<SReservationState, SReceivedReservationListAction>(_receivedSReservationList),
//  new TypedReducer<SReservationState, ReceivedSReservationDetailAction>(_receivedSReservationDetail),
//  new TypedReducer<SReservationState, FetchSReservationDetailFailedAction>(_loadFailedSReservationDetail),
  new TypedReducer<SReservationState, SSelectedReservationAction>(_selectedSReservation),
]);

SReservationState _receivedSReservationList(SReservationState state, SReceivedReservationListAction action) {
  return state.copyWith(
    sReservationList: action.sReservationList,
    loadingStatus: LoadingStatus.success,
  );
}

//SReservationState _receivedSReservationDetail(SReservationState state, ReceivedSReservationDetailAction action) {
//  List<SReservation> oldSReservationList = state.sSReservationList;
//  List<SReservation> newSReservationList = oldSReservationList.map((item) {
//    if (item.id == action.sSReservation?.id) {
//      return action.sSReservation;
//    } else {
//      return item;
//    }
//  }).toList();
//  return state.copyWith(
//    loadingStatus: LoadingStatus.success,
//    sSReservationList: newSReservationList,
//  );
//}
//
//SReservationState _loadFailedSReservationDetail(SReservationState state, FetchSReservationDetailFailedAction action) {
//  return state.copyWith(
//    loadingStatus: LoadingStatus.failed,
//  );
//}
//
SReservationState _selectedSReservation(SReservationState state, SSelectedReservationAction action) {
  print("selected:${action.rId}");
  return state.copyWith(
    selectedSReservationId: action.rId,
  );
}
