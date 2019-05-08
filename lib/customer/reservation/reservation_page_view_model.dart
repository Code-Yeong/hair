import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class ReservationPageViewModel {
  final List<Reservation> reservationList;
  final String selectedReserId;
  ReservationPageViewModel({this.reservationList, this.selectedReserId});

  static ReservationPageViewModel fromStore(Store<AppState> store) {
    return ReservationPageViewModel(
      reservationList: store.state.reservationState.reservationList ?? [],
      selectedReserId: store.state.reservationState.selectedReservationId ?? null,
    );
  }

//  Reservation get selectedReservation {
//    if (selectedReserId == null) {
//      return null;
//    }
//    List<Reservation> selectedReservationList = this.reservationList.where((reservation) => reservation.rId == selectedReserId).toList();
//    if (selectedReservationList.length > 0) {
//      return selectedReservationList.first;
//    }
//    return null;
//  }
}
