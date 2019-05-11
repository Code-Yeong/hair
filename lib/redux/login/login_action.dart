import 'package:hair/utils/enum.dart';

class ChangeRoleAction {
  final Role role;
  ChangeRoleAction({this.role});
}

class BeginLoginAction {
  final String phone;
  final String name;
  final String password;

  BeginLoginAction({this.phone, this.name, this.password});
}

class LoginSuccessAction {}

class LoginFailedAction {}

class LoginOutAction {}

class BeginSignupAction {
  final String phone;
  final String name;
  final String password;

  BeginSignupAction({this.phone, this.name, this.password});
}

class SignupSuccessAction {}

class SignupFailedAction {}
//
//class LoginOutAction {}
