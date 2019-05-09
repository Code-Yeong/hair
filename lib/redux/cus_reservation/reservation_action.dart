import 'package:hair/model/reservation.dart';

//接收到所有订单列表的发出
class ReceivedReservationListAction {
  final List<Reservation> reservationList;
  ReceivedReservationListAction({this.reservationList});
}

//要获取所有订单列表时发出
class BeginFetchReservationListAction {}

////要获取某个订单详细信息时调用
//class BeginFetchReservationDetailAction {
//  String reservationId;
//  BeginFetchReservationDetailAction({this.reservationId});
//}

//获取到了某个订单详细信息时发出
class ReceivedReservationDetailAction {
  final Reservation reservation;
  ReceivedReservationDetailAction({this.reservation});
}

//获取某个订单详细信息失败时发出
class FetchReservationDetailFailedAction {}

//选中某个店铺时发出,保存被选中的订单id，以便在进入订单详情页时取用
class SelectedReservationAction {
  final String rId;
  SelectedReservationAction({this.rId});
}
