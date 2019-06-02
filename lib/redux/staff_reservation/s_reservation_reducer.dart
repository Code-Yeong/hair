import 'package:hair/model/reservation.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/staff_reservation/s_reservation_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final sReservationReducers = combineReducers<SReservationState>([
  new TypedReducer<SReservationState, SReceivedReservationListAction>(_receivedSReservationList),
//  new TypedReducer<SReservationState, ReceivedSReservationDetailAction>(_receivedSReservationDetail),
//  new TypedReducer<SReservationState, FetchSReservationDetailFailedAction>(_loadFailedSReservationDetail),
  new TypedReducer<SReservationState, SSelectedReservationAction>(_selectedSReservation),
  new TypedReducer<SReservationState, ReservationVerifySuccessAction>(_VerifyReservation),
  new TypedReducer<SReservationState, ReceivedBarberCommentAction>(_receivedCommentList),
]);

SReservationState _receivedSReservationList(SReservationState state, SReceivedReservationListAction action) {
  print("你在这里把订单输出:${action.sReservationList}");
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

SReservationState _VerifyReservation(SReservationState state, ReservationVerifySuccessAction action) {
  Reservation reservation = state.findById(action.resId);
  reservation = reservation.copyWith(verified: '1');
  List<Reservation> newList = state.sReservationList.map((r) {
    if (r.rId == action.resId) {
      return reservation;
    }
    return r;
  }).toList();
  return state.copyWith(sReservationList: newList);
}

SReservationState _receivedCommentList(SReservationState state, ReceivedBarberCommentAction action) {
  print('fuzhi:${action.commentList.length}');
  return state.copyWith(
    barberCommentList: action.commentList,
  );
}
