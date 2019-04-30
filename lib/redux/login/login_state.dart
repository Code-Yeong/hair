enum LoginStatus {
  unknown,
  loading,
  success,
  failed,
}

class LoginState {
  LoginStatus loginStatus;

  LoginState({this.loginStatus});

  factory LoginState.initial() {
    return LoginState(
      loginStatus: LoginStatus.unknown,
    );
  }

  LoginState copyWith({
    LoginStatus loginStatus,
  }) {
    return new LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
