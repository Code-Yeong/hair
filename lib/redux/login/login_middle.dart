import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/customer.dart';
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
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    print("action=$action");
    if (action is BeginLoginAction) {
      var res = await ServerApi.api.customerSignIn(phone: action.phone, password: action.password);
      var toastMsg;
      print(res?.data);
      if (res != null && res?.data['status'] == '200') {
        Customer customer = Customer.fromObj(res?.data['result']);

        store.dispatch(new LoginSuccessAction(customer: customer));
        GlobalNavigator.shared.pushNamed(CustomerRoute.customerHomePage);
        toastMsg = '登录成功！';
      } else {
        store.dispatch(new LoginFailedAction());
        toastMsg = '登录失败，请重试';
      }
      print(toastMsg);
    }
    // 注册 onTap
    if (action is BeginSignupAction) {
      var res = await ServerApi.api.customerRegist(phone: action.phone, name: action.name, password: action.password);
      var toastMsg;
      var newAction;
      print(res?.data);
      if (res != null && res?.data['result'] == 'ok') {
        newAction = new SignupSuccessAction();
        toastMsg = '注册成功！';
        GlobalNavigator.shared.pop();
      } else {
        newAction = new SignupFailedAction();
        toastMsg = '提交失败，请重试';
      }
      store.dispatch(newAction);
      print(toastMsg);
//      报错的toast
//      Fluttertoast.showToast(
//          msg: toastMsg,
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.black.withOpacity(0.8),
//          textColor: Colors.white,
//          fontSize: 16.0);
    }
  }
}
