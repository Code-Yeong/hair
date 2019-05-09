import 'package:hair/redux/app/app_state.dart';
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
  }
}
