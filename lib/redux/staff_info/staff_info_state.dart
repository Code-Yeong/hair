import 'package:hair/model/barber.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';

class StaffInfoState {
  final Barber barber;
  final CommitStatus commitStatus;
  final LoadingStatus loadingStatus;

  StaffInfoState({this.barber, this.commitStatus, this.loadingStatus});

  factory StaffInfoState.initial() {
    return StaffInfoState(
      barber: null,
      commitStatus: CommitStatus.init,
      loadingStatus: LoadingStatus.init,
    );
  }

  StaffInfoState copyWith({
    Barber barber,
    CommitStatus commitStatus,
    LoadingStatus loadingStatus,
  }) {
//    print("copyWith的barber：${barber.addrList.length}");
    return StaffInfoState(
      barber: barber ?? this.barber,
      commitStatus: commitStatus ?? this.commitStatus,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
