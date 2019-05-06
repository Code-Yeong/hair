import 'package:hair/model/customer.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';

class CusInfoState {
  final Customer customer;
  final CommitStatus commitStatus;
  final LoadingStatus loadingStatus;

  CusInfoState({this.customer, this.commitStatus, this.loadingStatus});

  factory CusInfoState.initial() {
    return CusInfoState(
      customer: null,
      commitStatus: CommitStatus.init,
      loadingStatus: LoadingStatus.init,
    );
  }

  CusInfoState copyWith({
    Customer customer,
    CommitStatus commitStatus,
    LoadingStatus loadingStatus,
  }) {
    print("copyWith的customer：${customer.addrList.length}");
    return CusInfoState(
      customer: customer ?? this.customer,
      commitStatus: commitStatus ?? this.commitStatus,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
