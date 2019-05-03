import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_middle.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware() {
  var list = new List<Middleware<AppState>>();
  list.addAll(createLoginMiddleware());
  list.add(AppMiddleware());
  return list;
}

class AppMiddleware extends MiddlewareClass<AppState> {
  AppMiddleware();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
  }
}
