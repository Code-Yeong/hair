import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_middleware.dart';
import 'package:hair/redux/cus_info/cus_info_middle.dart';
import 'package:hair/redux/cus_reservation/reservation_middle.dart';
import 'package:hair/redux/login/login_middle.dart';
import 'package:hair/redux/shop/shop_middle.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware() {
  var list = new List<Middleware<AppState>>();
  list.addAll(createLoginMiddleware());
  list.addAll(createChooseReservationMiddle());
  list.addAll(createCusInfoMiddle());
  list.addAll(createShopMiddleware());
  list.addAll(createReservationMiddleware());
  list.add(AppMiddleware());
  return list;
}

class AppMiddleware extends MiddlewareClass<AppState> {
  AppMiddleware();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
  }
}
