import 'package:hair/redux/login/login_action.dart';
import 'package:hair/redux/login/login_state.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginState>([
  new TypedReducer<LoginState, BeginLoginAction>(_beginLogin),
  new TypedReducer<LoginState, LoginSuccessAction>(_loginSuccess),
  new TypedReducer<LoginState, LoginFailedAction>(_loginFailed),
  new TypedReducer<LoginState, ChangeRoleAction>(_changeRole),
]);

LoginState _beginLogin(LoginState state, BeginLoginAction action) {
  return state.copyWith(loginStatus: LoginStatus.loading);
}

LoginState _loginSuccess(LoginState state, LoginSuccessAction action) {
  return state.copyWith(loginStatus: LoginStatus.success);
}

LoginState _loginFailed(LoginState state, LoginFailedAction action) {
  return state.copyWith(loginStatus: LoginStatus.failed);
}

LoginState _changeRole(LoginState state, ChangeRoleAction action) {
  return state.copyWith(role: action.role);
}
