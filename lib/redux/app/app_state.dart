import 'package:hair/common/global_navigator.dart';
import 'package:hair/redux/login/login_state.dart';

class AppState {
  AppState({
    this.loginState,
    this.globalNavigator,
  });

  final LoginState loginState;
  final GlobalNavigator globalNavigator;

  factory AppState.initial() {
    print("initiate state");
    return AppState(
      loginState: new LoginState.initial(),
      globalNavigator: new GlobalNavigator(),
    );
  }
}
