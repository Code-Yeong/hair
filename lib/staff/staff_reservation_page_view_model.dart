import 'package:hair/model/reservation.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/store.dart';
import 'package:redux/redux.dart';

class StaffReservationPageViewModel {
  final List<Reservation> reservationList;
  final String selectedReservationId;
  StaffReservationPageViewModel({this.reservationList, this.selectedReservationId});

  static StaffReservationPageViewModel fromStore(Store<AppState> store) {
    return StaffReservationPageViewModel(
      reservationList: store.state.sReservationState.sReservationList ?? [],
      selectedReservationId: store.state.sReservationState.selectedSReservationId ?? null,
    );
  }

  String getShopName(String shopId) {
    List<Shop> shopList = globalStore.state.shopState.shopList.where((shop) => shop?.id == shopId).toList();
    if (shopList.length > 0) {
      return shopList.first?.name;
    }
    return "";
  }

  List<Reservation> getWaitingList() {
    if (this.reservationList.length <= 0) {
      return null;
    }
    List<Reservation> list = this.reservationList.where((reservation) => reservation.status == '1').toList();
    return list;
  }

  List<Reservation> getProcessingList() {
    if (this.reservationList.length <= 0) {
      return null;
    }
    List<Reservation> list = this.reservationList.where((reservation) => reservation.status == '2').toList();
    return list;
  }

  List<Reservation> getCompleteList() {
    if (this.reservationList.length <= 0) {
      return null;
    }
    List<Reservation> list =
        this.reservationList.where((reservation) => reservation.status == '3' || reservation.status == '4' || reservation.status == '5').toList();
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
