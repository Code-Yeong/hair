import 'package:hair/customer/reservation/time_zone.dart';
import 'package:hair/model/Barber.dart';
import 'package:hair/model/address.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

class ChooseReservationTimeViewModel {
  final List<Reservation> orderList;
  final CommitStatus commitStatus;
  final String selectedTime;
  final LoadingStatus loadingStatus;
  final List<Address> userAddressList;
  final Barber currentBarber;

  ChooseReservationTimeViewModel({
    this.orderList,
    this.commitStatus,
    this.selectedTime,
    this.loadingStatus,
    this.userAddressList,
    this.currentBarber,
  });

  static ChooseReservationTimeViewModel fromStore(Store<AppState> store) {
    return ChooseReservationTimeViewModel(
      orderList: store.state.chooseReservationTimeState.orderList,
      commitStatus: store.state.chooseReservationTimeState.commitStatus,
      selectedTime: store.state.chooseReservationTimeState.selectedTime,
      loadingStatus: store.state.chooseReservationTimeState.loadingStatus,
      userAddressList: store.state.loginState.customer.addrList,
      currentBarber: store.state.chooseReservationTimeState.currentBarber,
    );
  }

  bool get isSelectedTimeItem {
    return selectedTime != null && selectedTime.length > 0;
  }

//  getList(){
//    DateUtil.getNowDateStr()
//  }

  //是否被预定
  bool isReserved(int block, int timeArea) {
    String time;
    if (block == 1) {
      time = DateTimeUtils.today();
    } else if (block == 2) {
      time = DateTimeUtils.nextOneDay();
    }
    if (block == 3) {
      time = DateTimeUtils.nextTwoDay();
    }

    List<Reservation> resultList = this.orderList.where((order) {
      String orderTime = order.serveTime;
      List<String> arr = orderTime.split("-");
      if (arr.length == 2) {
        bool isReserved = (time.contains(DateTimeUtils.getDayFromStr(timeInMillSecondStr: arr[0])) && "$timeArea" == arr[1]);
        return isReserved;
      } else {
        return false;
      }
    }).toList();
    if (resultList.length > 0) {
      return true;
    }
    return false;
  }

  String get defaultAddress {
    List<Address> userDefaultAddressList = userAddressList.where((address) => address.status == "2").toList();
    if (userDefaultAddressList.length > 0) {
      return userDefaultAddressList.first?.address ?? "";
    }
    return "";
  }
}
