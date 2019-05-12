import 'package:hair/model/customer.dart';
import 'package:hair/utils/enum.dart';

enum LoginStatus {
  unknown,
  loading,
  success,
  failed,
}

class LoginState {
  final LoginStatus loginStatus;
  final Role role;

  LoginState({this.loginStatus, this.role});

  factory LoginState.initial() {
    return LoginState(
      loginStatus: LoginStatus.unknown,
      role: Role.customer,
    );
  }

  LoginState copyWith({
    LoginStatus loginStatus,
    Customer customer,
    Role role,
  }) {
    return new LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      role: role ?? this.role,
    );
  }
}
