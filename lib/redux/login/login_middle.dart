import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/config/server_api.dart';
import 'package:hair/model/customer.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/login/login_action.dart';
import 'package:hair/utils/enum.dart';
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
//    print("登录中间件 action=$action");

    //  登录
    if (action is BeginLoginAction) {
      var toastMsg;
      if (action.role == Role.customer) {
        var res = await ServerApi.api.customerSignIn(phone: action.phone, password: action.password);
        if (res != null && res?.data['status'] == 100) {
          Customer customer = Customer.fromObj(res?.data['result']);
          print("正在登录的 coustomer id=${customer.id}");
          store.dispatch(new LoginSuccessAction(customer: customer));
          store.dispatch(new ReceivedCusInfoAction(customer: customer));
          GlobalNavigator.shared.pushNamed(CustomerRoute.customerHomePage);
          toastMsg = '登录成功！';
        } else {
          store.dispatch(new LoginFailedAction());
          toastMsg = '登录失败，请重试';
        }
      } else if (action.role == Role.barber) {
        //  TODO: 职工登录dio
        toastMsg = '待完成的staff登录功能';
        var res = await ServerApi.api.customerSignIn(phone: action.phone, password: action.password);
        if (res != null && res?.data['status'] == 100) {
          Customer customer = Customer.fromObj(res?.data['result']);
          print("正在登录的 coustomer id=${customer.id}");
          store.dispatch(new LoginSuccessAction(customer: customer));
          store.dispatch(new ReceivedCusInfoAction(customer: customer));
          GlobalNavigator.shared.pushNamed(CustomerRoute.customerHomePage);
          toastMsg = '登录成功！';
        } else {
          store.dispatch(new LoginFailedAction());
          toastMsg = '登录失败，请重试';
          GlobalNavigator.shared.pushNamed(StaffRoute.staffHomePage);
        }
        print(toastMsg);
      }
    }
    //  注册
    if (action is BeginSignupAction) {
      var toastMsg;

      if (action.role == Role.customer) {
        var res = await ServerApi.api.customerRegist(phone: action.phone, name: action.name, password: action.password);
        print("发送注册 data= ${res?.data}");
        if (res != null && res?.data['result'] == 'ok') {
          store.dispatch(SignupSuccessAction());
          toastMsg = '注册成功！';
          GlobalNavigator.shared.pop();
        } else {
          store.dispatch(SignupFailedAction());
          toastMsg = '提交失败，请重试';
        }
      } else {
        //  TODO: 职工注册dio
        toastMsg = '待完成的staff注册功能';
//        GlobalNavigator.shared.pop();
      }

      print(toastMsg);
    }
  }
}
