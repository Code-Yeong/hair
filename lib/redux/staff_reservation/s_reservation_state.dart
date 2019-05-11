import 'package:hair/model/reservation.dart';
import 'package:hair/utils/enum.dart';

class SReservationState {
  final String selectedSReservationId; //存储在订单列表页被选中的订单id
  final List<Reservation> sReservationList;
  final LoadingStatus loadingStatus;

  SReservationState({this.selectedSReservationId, this.sReservationList, this.loadingStatus});

  factory SReservationState.initial() {
    return SReservationState(
      selectedSReservationId: null,
      loadingStatus: LoadingStatus.init,
      sReservationList: [],
    );
  }

  SReservationState copyWith({
    String selectedSReservationId,
    List<Reservation> sReservationList,
    LoadingStatus loadingStatus,
  }) {
    return SReservationState(
      selectedSReservationId: selectedSReservationId ?? this.selectedSReservationId,
      sReservationList: sReservationList ?? this.sReservationList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  Reservation findById(String id) {
    if (selectedSReservationId == null) {
      return null;
    }
    List<Reservation> selectedReservationList = this.sReservationList.where((reservation) => reservation.rId == id).toList();
    if (selectedReservationList.length > 0) {
      return selectedReservationList.first;
    }
    return null;
  }
}
