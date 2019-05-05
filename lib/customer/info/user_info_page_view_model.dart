import 'package:hair/model/customer.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

class UserInfoPageViewModel {
  final Customer customer;
  final CommitStatus commitStatus;
  final LoadingStatus loadingStatus;

  UserInfoPageViewModel({this.customer, this.commitStatus, this.loadingStatus});

  static UserInfoPageViewModel fromStore(Store<AppState> store) {
    return UserInfoPageViewModel(
      customer: store?.state?.loginState?.customer ?? null,
      commitStatus: store.state.cusInfoState.commitStatus,
      loadingStatus: store.state.cusInfoState.loadingStatus,
    );
  }
}
