import 'package:hair/model/reservation.dart';
import 'package:hair/utils/enum.dart';

class ReservationState {
  final String selectedReservationId; //存储在订单列表页被选中的订单id
  final List<Reservation> reservationList;
  final LoadingStatus loadingStatus;

  ReservationState({this.selectedReservationId, this.reservationList, this.loadingStatus});

  factory ReservationState.initial() {
    return ReservationState(
      selectedReservationId: null,
      loadingStatus: LoadingStatus.init,
      reservationList: [],
    );
  }

  ReservationState copyWith({
    String selectedReservationId,
    List<Reservation> reservationList,
    LoadingStatus loadingStatus,
  }) {
    return ReservationState(
      selectedReservationId: selectedReservationId ?? this.selectedReservationId,
      reservationList: reservationList ?? this.reservationList,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  Reservation findById(String id) {
    if (selectedReservationId == null) {
      return null;
    }
    List<Reservation> selectedReservationList = this.reservationList.where((reservation) => reservation.rId == id).toList();
    if (selectedReservationList.length > 0) {
      return selectedReservationList.first;
    }
    return null;
  }
}
