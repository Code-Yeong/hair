import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(loginState: loginReducer(state.loginState, action));
}
