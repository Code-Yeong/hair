import 'package:hair/model/customer.dart';

class BeginLoginAction {
  final bool isCustomer;
  final String phone;
  final String name;
  final String password;

  BeginLoginAction({this.isCustomer, this.phone, this.name, this.password});
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
  final bool isCustomer;

  BeginSignupAction({this.isCustomer, this.phone, this.name, this.password});
}

class SignupSuccessAction {}

class SignupFailedAction {}
//
//class LoginOutAction {}
