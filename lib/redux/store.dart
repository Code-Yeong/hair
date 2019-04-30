import 'package:hair/redux/app/app_middleware.dart';
import 'package:hair/redux/app/app_reducer.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:redux/redux.dart';

Store<AppState> globalStore;

Store<AppState> createStore() {
  globalStore = new Store(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
    middleware: createMiddleware(),
  );
  return globalStore;
}
