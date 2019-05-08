import 'package:hair/common/global_navigator.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/reservation.dart';
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
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is InitChooseReservationAction) {
      print("InitChooseReservationAction is excuting");
    } else if (action is BeginFetchChooseReservationDataAction) {
      //开始网络请求数据
      var res = await ServerApi.api.getBarberUnStartOrder(id: action.id);
      if (res != null && res?.data['status'] == 100) {
        List<Reservation> orderList = Reservation.fromObjList(res.data['result']);
        store.dispatch(new ReceivedChooseReservationDataAction(orderList: orderList));
      } else {
        store.dispatch(new ChooseReservationDataLoadErrorAction());
      }
    } else if (action is BeginCommitReservationAction) {
      var res = await ServerApi.api.addOrder(
        cusId: action.cusId,
        barberId: action.barberId,
        shopId: action.shopId,
        serveTime: action.serveTime,
        serveName: action.serveName,
        money: action.money,
      );
      print('订单添加结果:res=${res}');
      if (res != null && res?.data["status"] == 100) {
        print("订单添加成功");
        store.dispatch(new CommitReservationSuccessAction());
        GlobalNavigator.shared.pop();
      } else {
        print("订单添加失败");
        store.dispatch(new CommitReservationFailedAction());
      }
    }
  }
}
