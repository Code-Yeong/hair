import 'package:hair/redux/cus_reservation/reservation_action.dart';
import 'package:hair/redux/cus_reservation/reservation_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final reservationReducers = combineReducers<ReservationState>([
  new TypedReducer<ReservationState, ReceivedReservationListAction>(_receivedReservationList),
//  new TypedReducer<ReservationState, ReceivedReservationDetailAction>(_receivedReservationDetail),
//  new TypedReducer<ReservationState, FetchReservationDetailFailedAction>(_loadFailedReservationDetail),
//  new TypedReducer<ReservationState, SelectedReservationAction>(_selectedReservation),
]);

ReservationState _receivedReservationList(ReservationState state, ReceivedReservationListAction action) {
  return state.copyWith(
    reservationList: action.reservationList,
    loadingStatus: LoadingStatus.success,
  );
}

//ReservationState _receivedReservationDetail(ReservationState state, ReceivedReservationDetailAction action) {
//  List<Reservation> oldReservationList = state.reservationList;
//  List<Reservation> newReservationList = oldReservationList.map((item) {
//    if (item.id == action.reservation?.id) {
//      return action.reservation;
//    } else {
//      return item;
//    }
//  }).toList();
//  return state.copyWith(
//    loadingStatus: LoadingStatus.success,
//    reservationList: newReservationList,
//  );
//}
//
//ReservationState _loadFailedReservationDetail(ReservationState state, FetchReservationDetailFailedAction action) {
//  return state.copyWith(
//    loadingStatus: LoadingStatus.failed,
//  );
//}
//
//ReservationState _selectedReservation(ReservationState state, SelectedReservationAction action) {
//  print("selected:${action.id}");
//  return state.copyWith(
//    selectedReservationId: action.id,
//  );
//}
