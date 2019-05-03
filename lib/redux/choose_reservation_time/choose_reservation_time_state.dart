import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';

class ChooseReservationTimeState {
  final List<String> timeList;
  final CommitStatus commitStatus;
  final String selectedTime;
  final LoadingStatus loadingStatus;

  ChooseReservationTimeState({this.timeList, this.commitStatus, this.selectedTime, this.loadingStatus});

  factory ChooseReservationTimeState.initial() {
    return ChooseReservationTimeState(
      timeList: [],
      commitStatus: null,
      selectedTime: '',
      loadingStatus: LoadingStatus.init,
    );
  }

  ChooseReservationTimeState copyWith({
    List<String> timeList,
    CommitStatus commitStatus,
    String selectedTime,
    LoadingStatus loadingStatus,
  }) {
    return ChooseReservationTimeState(
      timeList: timeList ?? this.timeList,
      selectedTime: selectedTime ?? this.selectedTime,
      commitStatus: commitStatus ?? this.commitStatus,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
