import 'package:hair/utils/enum.dart';

//改变角色
class ChangeRoleAction {
  final Role role;
  ChangeRoleAction({this.role});
}

//开始登录
class BeginLoginAction {
  final String phone;
  final String name;
  final String password;

  BeginLoginAction({this.phone, this.name, this.password});
}

//登录成功
class LoginSuccessAction {}

//登录失败
class LoginFailedAction {}

//注销
class LoginOutAction {}

//开始注册
class BeginSignupAction {
  final String phone;
  final String name;
  final String password;

  BeginSignupAction({this.phone, this.name, this.password});
}

//注册成功
class SignupSuccessAction {}

//注册失败
class SignupFailedAction {}
//
//class LoginOutAction {}
