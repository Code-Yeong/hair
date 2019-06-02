import 'package:hair/component/toast.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/comment.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_reservation/reservation_action.dart';
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
//      print("staff登录未实现，staffId被我写成静态的辣！！！");
//      String staffId = '101';
      String staffId = store.state.staffInfoState.barber?.id;
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
      print("获取订单信息res:$res");
      if (res != null && res?.data['status'] == 100) {
        print("修改订单状态成功，返回res:$res");
        if (action.role == Role.barber) {
          if (action.status == '2') {
            showToast(text: '接单成功');
          }
          globalStore.dispatch(new SBeginFetchReservationListAction());
        } else if (action.role == Role.customer) {
          showToast(text: '订单状态修改成功');
          globalStore.dispatch(new BeginFetchReservationListAction());
        }
      } else {
        showToast(text: '订单状态修改失败');
      }
    }
    // edit status
    if (action is ReservationVerifyAction) {
      var res = await ServerApi.api.verifyOrder(orderId: action.resId);
      print("VERIFY订单res:$res");
      if (res != null && res?.data['status'] == 100) {
        showToast(text: '订单确认成功');
        globalStore.dispatch(new ReservationVerifySuccessAction(resId: action.resId));
      } else {
        showToast(text: '订单确认失败');
      }
    }

    if (action is SQueryScanResultAction) {
      String rId = store.state.sReservationState.selectedSReservationId;
      var res = await ServerApi.api.listenReservationStatus(rId: rId);
      print("订单的状态监听结果:$res");
//      print("订单的状态监听结果:${res.data['result'][0]['status']}");
//      print("订单的状态监听结果:${res.data['result'][0]['status'] == 2}");
      if (res != null && res?.data['status'] == 100) {
        if (res.data['result'][0]['status'] == 3) {
          globalStore.dispatch(new SBeginFetchReservationListAction());
          showToast(text: '订单已完成');
        }
      } else {
        showToast(text: '订单确认失败');
      }
    }

    if (action is FetchBarberCommentAction) {
      var res = await ServerApi.api.getBarberComment(barberId: action.barberId);
      print("理发师接收到的评论列表: ${res != null && res?.data['status'] == 100}");
      if (res != null && res?.data['status'] == 100) {
        List<Comment> commentList = Comment.fromObjList(res.data['result']);
        print('return rsult:${commentList.length}');
        globalStore.dispatch(new ReceivedBarberCommentAction(commentList: commentList));
      } else {
        showToast(text: '信息获取失败');
      }
    }
  }
}
