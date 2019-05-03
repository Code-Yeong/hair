import 'package:hair/common/global_navigator.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_state.dart';
import 'package:hair/redux/cus_info/cus_info_state.dart';
import 'package:hair/redux/login/login_state.dart';

class AppState {
  AppState({
    this.loginState,
    this.chooseReservationTimeState,
    this.globalNavigator,
    this.cusInfoState,
  });

  final LoginState loginState;
  final ChooseReservationTimeState chooseReservationTimeState;
  final CusInfoState cusInfoState;
  final GlobalNavigator globalNavigator;

  factory AppState.initial() {
    print("initiate state");
    return AppState(
      loginState: new LoginState.initial(),
      chooseReservationTimeState: new ChooseReservationTimeState.initial(),
      globalNavigator: GlobalNavigator.shared,
      cusInfoState: new CusInfoState.initial(),
    );
  }
}
