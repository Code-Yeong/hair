import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_action.dart';
import 'package:hair/redux/store.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createLoginMiddleware() {
  return <Middleware<AppState>>[
    new LoginMiddleware(),
  ];
}

class LoginMiddleware extends MiddlewareClass<AppState> {
  LoginMiddleware();
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    if (action is BeginLoginAction) {
      print('${globalStore.state.loginState.loginStatus}');
    }
  }
}
