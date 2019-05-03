enum CommitStatus {
  init,
  committing,
  success,
  failed,
}

class InitChooseReservationAction {}

class BeginFetchChooseReservationDataAction {}

class ReceivedChooseReservationDataAction {
  List<String> timeList;
  ReceivedChooseReservationDataAction({this.timeList});
}

class ChooseReservationDataLoadErrorAction {}

class SelectedTimeItemAction {
  final String selectedTime;
  SelectedTimeItemAction({this.selectedTime});
}

class BeginCommitReservationAction {}

class CommitReservationSuccessAction {}

class CommitReservationFailedAction {}
