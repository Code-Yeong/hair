import 'package:hair/redux/login/login_action.dart';
import 'package:hair/redux/login/login_state.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginState>([
  new TypedReducer<LoginState, BeginLoginAction>(_beginLogin),
]);

LoginState _beginLogin(LoginState state, BeginLoginAction action) {
  return state.copyWith(loginStatus: LoginStatus.loading);
}
