import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

class ChooseReservationTimeViewModel {
  final List<String> timeList;
  final CommitStatus commitStatus;
  final String selectedTime;
  final LoadingStatus loadingStatus;

  ChooseReservationTimeViewModel({
    this.timeList,
    this.commitStatus,
    this.selectedTime,
    this.loadingStatus,
  });

  static ChooseReservationTimeViewModel fromStore(Store<AppState> store) {
    return ChooseReservationTimeViewModel(
      timeList: store.state.chooseReservationTimeState.timeList,
      commitStatus: store.state.chooseReservationTimeState.commitStatus,
      selectedTime: store.state.chooseReservationTimeState.selectedTime,
      loadingStatus: store.state.chooseReservationTimeState.loadingStatus,
    );
  }

  bool get isSelectedTimeItem {
    return selectedTime != null && selectedTime.length > 0;
  }
}
