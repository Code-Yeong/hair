import 'package:hair/redux/login/login_action.dart';
import 'package:hair/redux/login/login_state.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginState>([
  new TypedReducer<LoginState, BeginLoginAction>(_beginLogin),
  new TypedReducer<LoginState, LoginSuccessAction>(_loginSuccess),
]);

LoginState _beginLogin(LoginState state, BeginLoginAction action) {
  return state.copyWith(loginStatus: LoginStatus.loading);
}

LoginState _loginSuccess(LoginState state, LoginSuccessAction action) {
  return state.copyWith(loginStatus: LoginStatus.success);
}
