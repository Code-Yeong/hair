import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_reducer.dart';
import 'package:hair/redux/cus_info/cus_info_reducer.dart';
import 'package:hair/redux/cus_reservation/reservation_reducer.dart';
import 'package:hair/redux/login/login_reducer.dart';
import 'package:hair/redux/shop/shop_reducer.dart';
import 'package:hair/redux/staff_info/staff_info_reducer.dart';
import 'package:hair/redux/staff_reservation/s_reservation_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    loginState: loginReducer(state.loginState, action),
    chooseReservationTimeState: chooseReservationTimeReducers(state.chooseReservationTimeState, action),
    cusInfoState: cusInfoReducers(state.cusInfoState, action),
    staffInfoState: staffInfoReducers(state.staffInfoState, action),
    shopState: shopReducers(state.shopState, action),
    reservationState: reservationReducers(state.reservationState, action),
    sReservationState: sReservationReducers(state.sReservationState, action),
  );
}
