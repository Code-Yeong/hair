import 'package:hair/model/customer.dart';

enum LoginStatus {
  unknown,
  loading,
  success,
  failed,
}

class LoginState {
  final LoginStatus loginStatus;
  final Customer customer;

  LoginState({this.loginStatus, this.customer});

  factory LoginState.initial() {
    return LoginState(
      loginStatus: LoginStatus.unknown,
      customer: null,
    );
  }

  LoginState copyWith({
    LoginStatus loginStatus,
    Customer customer,
  }) {
    return new LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      customer: customer ?? this.customer,
    );
  }
}
