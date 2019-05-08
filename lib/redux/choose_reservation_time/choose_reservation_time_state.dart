import 'package:hair/model/Barber.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';

class ChooseReservationTimeState {
  final List<Reservation> orderList;
  final CommitStatus commitStatus;
  final String selectedTime;
  final Barber currentBarber;
  final LoadingStatus loadingStatus;

  ChooseReservationTimeState({this.orderList, this.currentBarber, this.commitStatus, this.selectedTime, this.loadingStatus});

  factory ChooseReservationTimeState.initial() {
    return ChooseReservationTimeState(
      orderList: [],
      commitStatus: CommitStatus.init,
      selectedTime: null,
      loadingStatus: LoadingStatus.init,
      currentBarber: null,
    );
  }

  ChooseReservationTimeState copyWith({
    List<Reservation> orderList,
    CommitStatus commitStatus,
    String selectedTime,
    LoadingStatus loadingStatus,
    Barber currentBarber,
  }) {
    return ChooseReservationTimeState(
      orderList: orderList ?? this.orderList,
      selectedTime: selectedTime ?? this.selectedTime,
      commitStatus: commitStatus ?? this.commitStatus,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      currentBarber: currentBarber ?? this.currentBarber,
    );
  }
}
