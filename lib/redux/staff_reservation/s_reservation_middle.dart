import 'package:hair/config/server_api.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createSReservationMiddleware() {
  return <Middleware<AppState>>[
    new SReservationMiddleware(),
  ];
}

class SReservationMiddleware extends MiddlewareClass<AppState> {
  SReservationMiddleware();
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is SBeginFetchReservationListAction) {
      print("staff登录未实现，staffId被我写成静态的辣！！！");
      String staffId = '101';
//      String staffId = store.state.staffInfoState.barber?.id;
      var res = await ServerApi.api.getOrderList(id: staffId, role: Role.barber);
      if (res != null && res?.data['status'] == 100) {
        print("获取订单信息成功，返回订单detail:$res");
        List<Reservation> reservationList = Reservation.fromObjList(res.data['result']);
        globalStore.dispatch(new SReceivedReservationListAction(sReservationList: reservationList));
      } else {
        print('获取订单信息失败');
      }
    }

    // edit status
    if (action is SBeginEditReservationStatusAction) {
//      String staffId = store.state.staffInfoState.barber?.id;
      var res = await ServerApi.api.editOrderStatus(orderId: action.resId, status: action.status);
//      print("获取订单信息res:$res");
      if (res != null && res?.data['status'] == 100) {
        print("修改订单状态成功，返回res:$res");
        globalStore.dispatch(new SBeginFetchReservationListAction());
      } else {
        print('修改订单信息失败');
      }
    }
  }
}
