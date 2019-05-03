import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_state.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

final chooseReservationTimeReducers = combineReducers<ChooseReservationTimeState>([
  new TypedReducer<ChooseReservationTimeState, InitChooseReservationAction>(_init),
  new TypedReducer<ChooseReservationTimeState, BeginFetchChooseReservationDataAction>(_loadingData),
  new TypedReducer<ChooseReservationTimeState, ReceivedChooseReservationDataAction>(_receivedData),
  new TypedReducer<ChooseReservationTimeState, ChooseReservationDataLoadErrorAction>(_loadError),
  new TypedReducer<ChooseReservationTimeState, SelectedTimeItemAction>(_selectedTimeItem),
  new TypedReducer<ChooseReservationTimeState, BeginCommitReservationAction>(_beginCommit),
  new TypedReducer<ChooseReservationTimeState, CommitReservationSuccessAction>(_commitSuccess),
  new TypedReducer<ChooseReservationTimeState, CommitReservationFailedAction>(_commitFailed),
]);

ChooseReservationTimeState _init(ChooseReservationTimeState state, InitChooseReservationAction action) {
  return state.copyWith(
    selectedTime: '',
    commitStatus: CommitStatus.init,
    timeList: [],
    loadingStatus: LoadingStatus.init,
  );
}

ChooseReservationTimeState _loadingData(ChooseReservationTimeState state, BeginFetchChooseReservationDataAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

ChooseReservationTimeState _receivedData(ChooseReservationTimeState state, ReceivedChooseReservationDataAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.success,
    timeList: action.timeList,
  );
}

ChooseReservationTimeState _loadError(ChooseReservationTimeState state, ChooseReservationDataLoadErrorAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.failed);
}

ChooseReservationTimeState _selectedTimeItem(ChooseReservationTimeState state, SelectedTimeItemAction action) {
  String _selectedTime = '';
  if (state.selectedTime == action.selectedTime) {
    _selectedTime = '';
  } else {
    _selectedTime = action.selectedTime;
  }
  return state.copyWith(selectedTime: _selectedTime);
}

ChooseReservationTimeState _beginCommit(ChooseReservationTimeState state, BeginCommitReservationAction action) {
  return state.copyWith(commitStatus: CommitStatus.committing);
}

ChooseReservationTimeState _commitSuccess(ChooseReservationTimeState state, CommitReservationSuccessAction action) {
  return state.copyWith(commitStatus: CommitStatus.success);
}

ChooseReservationTimeState _commitFailed(ChooseReservationTimeState state, CommitReservationFailedAction action) {
  return state.copyWith(commitStatus: CommitStatus.failed);
}
