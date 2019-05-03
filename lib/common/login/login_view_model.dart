import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_state.dart';
import 'package:redux/redux.dart';

class LoginViewModel {
  final LoginStatus loginStatus;
  LoginViewModel({
    this.loginStatus,
  });

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(loginStatus: store.state.loginState.loginStatus);
  }
}
