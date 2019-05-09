import 'package:hair/model/barber.dart';
import 'package:hair/model/reservation.dart';

enum CommitStatus {
  init,
  committing,
  success,
  failed,
}

class InitChooseReservationAction {}

class SetCurrentBarberAction {
  final Barber barber;
  SetCurrentBarberAction({this.barber});
}

class BeginFetchChooseReservationDataAction {
  String id;
  BeginFetchChooseReservationDataAction({this.id});
}

class ReceivedChooseReservationDataAction {
  List<Reservation> orderList;
  ReceivedChooseReservationDataAction({this.orderList});
}

class ChooseReservationDataLoadErrorAction {}

class SelectedTimeItemAction {
  final String selectedTime;
  SelectedTimeItemAction({this.selectedTime});
}

class BeginCommitReservationAction {
  final String cusId;
  final String barberId;
  final String shopId;
  final String serveTime;
  final num money;
  final String serveName;

  BeginCommitReservationAction({
    this.cusId,
    this.barberId,
    this.shopId,
    this.serveTime,
    this.money,
    this.serveName,
  });
}

class SetAddressAction {
  final bool enableOnTapPop; // 使 Address Page 中 address item 点击函数生效
  SetAddressAction({this.enableOnTapPop});
}

class CommitReservationSuccessAction {}

class CommitReservationFailedAction {}
