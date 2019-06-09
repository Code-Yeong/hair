import 'package:hair/model/barber.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';

class ChooseReservationTimeState {
  final List<Reservation> orderList;
  final CommitStatus commitStatus;
  final String selectedTime;
  final Barber currentBarber;
  final LoadingStatus loadingStatus;
  final bool enableOnTapPop;
  final String serveName;

  ChooseReservationTimeState({
    this.orderList,
    this.currentBarber,
    this.commitStatus,
    this.selectedTime,
    this.loadingStatus,
    this.enableOnTapPop,
    this.serveName,
  });

  factory ChooseReservationTimeState.initial() {
    return ChooseReservationTimeState(
      orderList: [],
      commitStatus: CommitStatus.init,
      selectedTime: null,
      loadingStatus: LoadingStatus.init,
      currentBarber: null,
      enableOnTapPop: false,
      serveName: '',
    );
  }

  ChooseReservationTimeState copyWith({
    List<Reservation> orderList,
    CommitStatus commitStatus,
    String selectedTime,
    LoadingStatus loadingStatus,
    Barber currentBarber,
    bool enableOnTapPop,
    String serveAddress,
    String serveName,
  }) {
    return ChooseReservationTimeState(
      orderList: orderList ?? this.orderList,
      selectedTime: selectedTime ?? this.selectedTime,
      commitStatus: commitStatus ?? this.commitStatus,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      currentBarber: currentBarber ?? this.currentBarber,
      enableOnTapPop: enableOnTapPop ?? this.enableOnTapPop,
      serveName: serveName ?? this.serveName,
    );
  }
}
