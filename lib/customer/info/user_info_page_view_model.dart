import 'package:hair/model/address.dart';
import 'package:hair/model/barber.dart';
import 'package:hair/model/customer.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/enum.dart';
import 'package:redux/redux.dart';

class UserInfoPageViewModel {
  final Customer customer;
  final Barber barber;
  final Role role = globalStore.state.loginState.role;
  final CommitStatus commitStatus;
  final LoadingStatus loadingStatus;

  UserInfoPageViewModel({this.customer, this.barber, this.commitStatus, this.loadingStatus});

  static UserInfoPageViewModel fromStore(Store<AppState> store) {
    return UserInfoPageViewModel(
      customer: store?.state?.cusInfoState?.customer ?? null,
      barber: store?.state?.staffInfoState?.barber ?? null,
      commitStatus: store.state.cusInfoState.commitStatus,
      loadingStatus: store.state.cusInfoState.loadingStatus,
    );
  }

  List<Address> get addressList {
    return customer?.addrList ?? [];
  }

  Address get selectedAddress {
    List<Address> address = addressList.where((address) {
      return address?.status?.toString() == '2';
    }).toList();
    if (address.length > 0) {
      return address.first;
    }
    return null;
  }
}
