import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createChooseReservationMiddle() {
  return <Middleware<AppState>>[
    ChooseReservationTimeMiddle(),
  ];
}

class ChooseReservationTimeMiddle extends MiddlewareClass<AppState> {
  ChooseReservationTimeMiddle();
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    if (action is InitChooseReservationAction || action is BeginFetchChooseReservationDataAction) {
      //开始网络请求数据
      var res = 'result';
      if (res != null) {
        Future.delayed(Duration(milliseconds: 5), () {
          store.dispatch(new ReceivedChooseReservationDataAction(timeList: []));
        });
      } else {
        store.dispatch(new ChooseReservationDataLoadErrorAction());
      }
    }
  }
}
