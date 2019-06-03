import 'dart:convert';

import 'package:hair/component/toast.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_action.dart';
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
        store.dispatch(new VerifySuccessAction());
        store.dispatch(new BeginLoginAction(password: store.state.staffInfoState.barber.password, phone: store.state.staffInfoState.barber.phone));
        showToast(text: '认证成功');
      } else {
        store.dispatch(new VerifyFailedAction());
        showToast(text: '认证失败');
      }
    }
  }
}
