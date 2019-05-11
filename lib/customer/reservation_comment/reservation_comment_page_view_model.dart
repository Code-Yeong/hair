import 'package:hair/model/barber.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/store.dart';
import 'package:redux/redux.dart';

class ReservationCommentPageViewModel {
  final Reservation reservation;
  final Barber barber;
  final Shop shop;

  ReservationCommentPageViewModel({this.reservation, this.barber, this.shop});

  static ReservationCommentPageViewModel fromStore(Store<AppState> store) {
    return ReservationCommentPageViewModel(
      reservation: store.state.reservationState.findById(store.state.reservationState.selectedReservationId),
    );
  }

  Shop getShop() {
    return globalStore.state.shopState.findById(reservation?.shopId);
  }
}
