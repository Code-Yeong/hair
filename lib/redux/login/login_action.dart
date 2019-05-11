import 'package:hair/model/customer.dart';
import 'package:hair/utils/enum.dart';

class BeginLoginAction {
  final Role role;
  final String phone;
  final String name;
  final String password;

  BeginLoginAction({this.role, this.phone, this.name, this.password});
}

class LoginSuccessAction {
  final Customer customer;

  LoginSuccessAction({this.customer});
}

class LoginFailedAction {}

class LoginOutAction {}

class BeginSignupAction {
  final String phone;
  final String name;
  final String password;
  final Role role;

  BeginSignupAction({this.role, this.phone, this.name, this.password});
}

class SignupSuccessAction {}

class SignupFailedAction {}
//
//class LoginOutAction {}
