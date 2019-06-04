import 'dart:convert';

import 'package:hair/component/toast.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/barber.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/staff_info/staff_info_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStaffInfoMiddle() {
  return <Middleware<AppState>>[
    StaffInfoMiddle(),
  ];
}

class StaffInfoMiddle extends MiddlewareClass<AppState> {
  StaffInfoMiddle();
  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    //理发师职业认证
    if (action is BeginVerifyAction) {
      String userId = store.state.staffInfoState.barber.id;
      var res = await ServerApi.api.staffVerify(image: action.certificate, name: action.name, idCard: action.idCard, id: userId);
      var result = json.decode(res.data);
      if (result['status'] == 106) {
        print('success');
        String certificate = result['data']['url'];
        Barber barber = store.state.staffInfoState.barber.copyWidth(name: action.name, idCard: action.idCard, status: 2, certificate: certificate);
        store.dispatch(new VerifySuccessAction(barber: barber));
//        GlobalNavigator.shared.pop();
        showToast(text: '认证成功');
      } else {
        print('failed');
        store.dispatch(new VerifyFailedAction());
        showToast(text: '认证失败');
      }
    }
  }
}
