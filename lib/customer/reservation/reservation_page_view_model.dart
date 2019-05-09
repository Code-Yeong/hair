import 'package:hair/model/reservation.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/store.dart';
import 'package:redux/redux.dart';

class ReservationPageViewModel {
  final List<Reservation> reservationList;
  final String selectedReservationId;
  ReservationPageViewModel({this.reservationList, this.selectedReservationId});

  static ReservationPageViewModel fromStore(Store<AppState> store) {
    return ReservationPageViewModel(
      reservationList: store.state.reservationState.reservationList ?? [],
      selectedReservationId: store.state.reservationState.selectedReservationId ?? null,
    );
  }

  String getShopName(String shopId) {
    List<Shop> shopList = globalStore.state.shopState.shopList.where((shop) => shop?.id == shopId).toList();
    if (shopList.length > 0) {
      return shopList.first?.name;
    }
    return "";
  }

  List<Reservation> getCommentingList() {
    if (this.reservationList.length <= 0) {
      return null;
    }
    List<Reservation> list = this.reservationList.where((reservation) => reservation.status == '3').toList();
    return list;
  }

  List<Reservation> getCanceledList() {
    if (this.reservationList.length <= 0) {
      return null;
    }
    List<Reservation> list = this.reservationList.where((reservation) => reservation.status == '5').toList();
    return list;
  }

  Reservation get selectedReservation {
    if (selectedReservationId == null) {
      return null;
    }
    List<Reservation> selectedReservationList = this.reservationList.where((reservation) => reservation.rId == selectedReservationId).toList();
    if (selectedReservationList.length > 0) {
      return selectedReservationList.first;
    }
    return null;
  }
}
