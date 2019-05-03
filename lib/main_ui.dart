import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/custom_navigator.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/store.dart';

class MainUI extends StatefulWidget {
  @override
  State createState() => MainUIState();
}

class MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: createStore(),
      child: MaterialApp(
        navigatorKey: GlobalNavigator.rootNavigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: "first App",
        home: MyNavigator(initialRoute: GlobalNavigator.shared.initialPage),
      ),
    );
  }
}
