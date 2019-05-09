import 'package:hair/common/global_navigator.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_state.dart';
import 'package:hair/redux/cus_info/cus_info_state.dart';
import 'package:hair/redux/cus_reservation/reservation_state.dart';
import 'package:hair/redux/login/login_state.dart';
import 'package:hair/redux/shop/shop_state.dart';
import 'package:hair/redux/staff_info/staff_info_state.dart';
import 'package:hair/redux/staff_reservation/s_reservation_state.dart';

class AppState {
  AppState(
      {this.loginState,
      this.chooseReservationTimeState,
      this.globalNavigator,
      this.cusInfoState,
      this.staffInfoState,
      this.shopState,
      this.reservationState,
      this.sReservationState});

  final LoginState loginState;
  final ChooseReservationTimeState chooseReservationTimeState;
  final CusInfoState cusInfoState;
  final StaffInfoState staffInfoState;
  final GlobalNavigator globalNavigator;
  final ShopState shopState;
  final ReservationState reservationState;
  final SReservationState sReservationState;

  factory AppState.initial() {
    print("initiate state");
    return AppState(
      loginState: new LoginState.initial(),
      chooseReservationTimeState: new ChooseReservationTimeState.initial(),
      globalNavigator: GlobalNavigator.shared,
      cusInfoState: new CusInfoState.initial(),
      staffInfoState: new StaffInfoState.initial(),
      shopState: new ShopState.initial(),
      reservationState: new ReservationState.initial(),
      sReservationState: new SReservationState.initial(),
    );
  }
}
