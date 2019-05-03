import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createCusInfoMiddle() {
  return <Middleware<AppState>>[
    CusInfoMiddle(),
  ];
}

class CusInfoMiddle extends MiddlewareClass<AppState> {
  CusInfoMiddle();
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    next(action);
    if (action is InitCusInfoAction) {
      var res;
    }
    if (action is BeginFetchCusInfoAction) {
      print("ddddddd:ddddddd");
    }
  }
}
