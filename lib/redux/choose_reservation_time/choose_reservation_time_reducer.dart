import 'package:hair/component/time_zone.dart';
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
  new TypedReducer<ChooseReservationTimeState, SetCurrentBarberAction>(_setCurrentBarber),
  new TypedReducer<ChooseReservationTimeState, SetAddressAction>(_setAddressOnTap),
]);

ChooseReservationTimeState _init(ChooseReservationTimeState state, InitChooseReservationAction action) {
  return state.copyWith(
    selectedTime: null,
    commitStatus: CommitStatus.init,
    orderList: [],
    loadingStatus: LoadingStatus.init,
  );
}

ChooseReservationTimeState _loadingData(ChooseReservationTimeState state, BeginFetchChooseReservationDataAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.loading, selectedTime: '');
}

ChooseReservationTimeState _receivedData(ChooseReservationTimeState state, ReceivedChooseReservationDataAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.success,
    orderList: action.orderList,
  );
}

ChooseReservationTimeState _loadError(ChooseReservationTimeState state, ChooseReservationDataLoadErrorAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.failed);
}

ChooseReservationTimeState _selectedTimeItem(ChooseReservationTimeState state, SelectedTimeItemAction action) {
  String _selectedTime = '';

  if (state.selectedTime == null || state.selectedTime.length == 0) {
    return state.copyWith(selectedTime: action.selectedTime);
  }
  String timeStrOld = state.selectedTime?.substring(0, state.selectedTime?.indexOf('-'));
  String timeStrNew = action.selectedTime?.substring(0, action.selectedTime?.indexOf('-'));
  String tailOld = state.selectedTime?.substring(state.selectedTime?.indexOf('-') ?? 0 + 1, state.selectedTime.length);
  String tailNew = action.selectedTime?.substring(action.selectedTime?.indexOf('-') ?? 0 + 1, action.selectedTime.length);

  String formatOld = timeStrOld != null ? DateTimeUtils?.getDayFromStr(timeInMillSecondStr: timeStrOld) : "";
  String formatNew = timeStrNew != null ? DateTimeUtils?.getDayFromStr(timeInMillSecondStr: timeStrNew) : "";

  if (formatOld == formatNew && tailNew == tailOld) {
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
  return state.copyWith(
    commitStatus: CommitStatus.success,
    selectedTime: null,
  );
}

ChooseReservationTimeState _commitFailed(ChooseReservationTimeState state, CommitReservationFailedAction action) {
  return state.copyWith(
    commitStatus: CommitStatus.failed,
    selectedTime: null,
  );
}

ChooseReservationTimeState _setCurrentBarber(ChooseReservationTimeState state, SetCurrentBarberAction action) {
  return state.copyWith(currentBarber: action.barber);
}

ChooseReservationTimeState _setAddressOnTap(ChooseReservationTimeState state, SetAddressAction action) {
  return state.copyWith(enableOnTapPop: action.enableOnTapPop);
}
