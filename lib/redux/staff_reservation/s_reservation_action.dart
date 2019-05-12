import 'package:hair/model/reservation.dart';
import 'package:hair/utils/enum.dart';

//接收到所有订单列表的发出
class SReceivedReservationListAction {
  final List<Reservation> sReservationList;
  SReceivedReservationListAction({this.sReservationList});
}

//要获取所有订单列表时发出
class SBeginFetchReservationListAction {}

//要修改某个订单状态时发出
class SBeginEditReservationStatusAction {
  final Role role;
  final String status;
  final String resId;
  SBeginEditReservationStatusAction({this.status, this.resId, this.role = Role.barber});
}

//要修改某个订单verified时发出
class ReservationVerifyAction {
  final String resId;
  ReservationVerifyAction({this.resId});
}

//修改某个订单verified成功发出
class ReservationVerifySuccessAction {
  final String resId;
  ReservationVerifySuccessAction({this.resId});
}

////要获取订单详细信息时调用
//class SBeginFetchReservationDetailAction {
//  String sReservationId;
//  SBeginFetchReservationDetailAction({this.sReservationId});
//}

//获取到了某个订单详细信息时发出
class SReceivedReservationDetailAction {
  final Reservation sReservation;
  SReceivedReservationDetailAction({this.sReservation});
}

//获取某个订单详细信息失败时发出
class SFetchReservationDetailFailedAction {}

//选中某个店铺时发出,保存被选中的订单id，以便在进入订单详情页时取用
class SSelectedReservationAction {
  final String rId;
  SSelectedReservationAction({this.rId});
}
