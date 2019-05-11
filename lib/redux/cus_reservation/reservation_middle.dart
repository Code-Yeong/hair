import 'package:hair/common/global_navigator.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_reservation/reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createReservationMiddleware() {
  return <Middleware<AppState>>[
    new ReservationMiddleware(),
  ];
}

class ReservationMiddleware extends MiddlewareClass<AppState> {
  ReservationMiddleware();
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is BeginFetchReservationListAction) {
      String cusId = store.state.cusInfoState.customer?.id;
      var res = await ServerApi.api.getOrderList(id: cusId, role: Role.customer);
      if (res != null && res?.data['status'] == 100) {
        print("获取订单信息成功，返回订单detail:$res");
        List<Reservation> reservationList = Reservation.fromObjList(res.data['result']);
        globalStore.dispatch(new ReceivedReservationListAction(reservationList: reservationList));
      } else {
        print('获取订单信息失败');
      }
    }

    if (action is CommentReservationAction) {
      var res = await ServerApi.api.commentOrder(orderId: action.resId, shopScore: action.shopScore, barberScore: action.barberScore, content: action.content);
      print("评价订单res:$res");
      if (res != null && res?.data['status'] == 100) {
        print("评价成功，返回订单detail:$res");
        store.dispatch(BeginFetchReservationListAction());
        GlobalNavigator.shared.pop();
      } else {
        print('评价订单失败');
      }
    }
  }
}
