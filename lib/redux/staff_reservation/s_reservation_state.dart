import 'package:hair/model/comment.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/utils/enum.dart';

class SReservationState {
  final String selectedSReservationId; //存储在订单列表页被选中的订单id
  final List<Reservation> sReservationList;
  final LoadingStatus loadingStatus;
  final List<Comment> barberCommentList;

  SReservationState({this.selectedSReservationId, this.sReservationList, this.loadingStatus, this.barberCommentList});

  factory SReservationState.initial() {
    return SReservationState(
      selectedSReservationId: null,
      loadingStatus: LoadingStatus.init,
      sReservationList: [],
      barberCommentList: [],
    );
  }

  SReservationState copyWith({
    String selectedSReservationId,
    List<Reservation> sReservationList,
    LoadingStatus loadingStatus,
    List<Comment> barberCommentList,
  }) {
    return SReservationState(
      selectedSReservationId: selectedSReservationId ?? this.selectedSReservationId,
      sReservationList: sReservationList ?? this.sReservationList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      barberCommentList: barberCommentList ?? this.barberCommentList,
    );
  }

  Reservation findById(String id) {
    if (id == null) {
      return null;
    }
    List<Reservation> selectedReservationList = this.sReservationList.where((reservation) => reservation.rId == id).toList();
    if (selectedReservationList.length > 0) {
      return selectedReservationList.first;
    }
    return null;
  }
}
