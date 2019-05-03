import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_action.dart';
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
    print("action=$action");
    if (action is BeginLoginAction) {
      var data = ServerApi.api.requestUrl();
      print("doi:data=$data");
      store.dispatch(new LoginSuccessAction());
      GlobalNavigator.shared.pushNamed(CustomerRoute.customerHomePage);
    }
  }
}
