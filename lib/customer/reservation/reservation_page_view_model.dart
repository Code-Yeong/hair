import 'package:hair/model/reservation.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/store.dart';
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

  String getShopName(String shopId) {
    List<Shop> shopList = globalStore.state.shopState.shopList.where((shop) => shop?.id == shopId).toList();
    if (shopList.length > 0) {
      return shopList.first?.name;
    }
    return "";
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
