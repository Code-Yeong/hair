import 'package:hair/common/global_navigator.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/address.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createCusInfoMiddle() {
  return <Middleware<AppState>>[
    CusInfoMiddle(),
  ];
}

class CusInfoMiddle extends MiddlewareClass<AppState> {
  CusInfoMiddle();
  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);
//    if (action is InitCusInfoAction) {
//      var res;
//    }
    if (action is CusAddressChangedAction) {
      // fetch address list
      String cusId = globalStore.state.loginState.customer?.id;
      var res = await ServerApi.api.getCustomerAddress(cusId: cusId);
//      print("地址查询结果：${res?.data}"); // array
      if (res != null && res?.data['status'] == 100) {
        List<Address> list = Address.fromObjList(res?.data['result']);
        globalStore.dispatch(ReceivedAddressListAction(addressList: list));
        GlobalNavigator.shared.pop();
      } else {
        print('地址查询失败');
      }
    }
    if (action is AddCusAddressInfoAction) {
      String cusId = store.state.loginState?.customer?.id;
      var res = await ServerApi.api.addCustomerAddress(
        cusId: cusId,
        name: action.address?.name,
        phone: action.address?.phone,
        address: action.address?.address,
        description: action.address?.description,
      );
      print("网络请求增加地址 :${res?.data}");
      if (res != null && res?.data['result'] == 'ok') {
        globalStore.dispatch(new CusAddressChangedAction());
      } else {
        print('地址增加失败');
      }
    }
    if (action is EditCusAddressInfoAction) {
      var res = await ServerApi.api.editCustomerAddress(
        addressId: action.address?.id,
        newName: action.address?.name,
        newPhone: action.address?.phone,
        newAddress: action.address?.address,
        newStatus: action.address?.status,
        description: action.address?.description,
      );
      print("网络请求修改地址 response:${res?.data}");
      if (res != null && res?.data['status'] == 100) {
        globalStore.dispatch(new CusAddressChangedAction());
      } else {
        print('地址修改失败');
      }
    }
    if (action is RemoveCusAddressInfoAction) {
      var res = await ServerApi.api.removeCustomerAddress(
        addressId: action.addressId,
      );
      print("网络请求修改地址 response:${res?.data}");
      if (res != null && res?.data['status'] == 100) {
        globalStore.dispatch(new CusAddressChangedAction());
      } else {
        print('地址删除失败');
      }
    }
  }
}
