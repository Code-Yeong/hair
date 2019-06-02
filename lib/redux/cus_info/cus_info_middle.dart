import 'dart:convert';

import 'package:hair/common/global_navigator.dart';
import 'package:hair/component/toast.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/address.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/enum.dart';
import 'package:image_picker/image_picker.dart';
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
      String cusId = globalStore.state.cusInfoState.customer?.id;
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
      String cusId = store.state.cusInfoState?.customer?.id;
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
        cusId: action.address?.cusId,
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

    if (action is UpdateCusInfoAction) {
      var res = await ServerApi.api.updateUserInfo(
        cus: action.cus,
        role: Role.customer,
      );
      print("网络请求修改地址 response:${res?.data}");
      if (res != null && res?.data['status'] == 100) {
        print('信息修改成功');
        globalStore.dispatch(new UpdateCusInfoSuccessAction(cus: action.cus));
      } else {
        globalStore.dispatch(new UpdateCusInfoFailedAction());
        print('信息修改失败');
      }
    }

    if (action is BeginEditAvatarAction) {
      String userId = store.state.cusInfoState.customer.id;
      Role role = Role.customer;
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      var res = await ServerApi.api.upLoadImage(image: image, id: userId, role: role);
      print(res.data);
      var result = json.decode(res.data);
      if (result['status'] == 106) {
        String avatarUrl = result['data']['url'];
        store.dispatch(new EditAvatarSuccessAction(avatarUrl: avatarUrl));
        showToast(text: '头像修改成功');
      } else {
        showToast(text: '头像修改失败');
      }
    }
  }
}
