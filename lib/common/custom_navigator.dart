import 'package:flutter/material.dart';
import 'package:hair/common/custom_navigator_observer.dart';
import 'package:hair/common/global_navigator.dart';

class MyNavigator extends StatelessWidget {
  final String initialRoute;
  final List<NavigatorObserver> observers;
  MyNavigator({
    this.initialRoute,
    this.observers = const <NavigatorObserver>[],
  });
  @override
  Widget build(BuildContext context) {
    //HeroController 否则使用 onGenerateRoute hero的效果无法实现
    List<NavigatorObserver> allObservers = [MyNavigatorObserver(), HeroController()];
    if (observers != null && observers.isNotEmpty) {
      allObservers.addAll(observers);
    }
    return new Navigator(
      key: GlobalNavigator.globalNavigatorKey,
      observers: allObservers,
      initialRoute: initialRoute,
      onGenerateRoute: (settings) {
        print('onGenerateRoute------------- ${settings.name}');
        final route = GlobalNavigator.shared.generateRouteFor(settings);
        if (route == null) {
          throw Exception('使用了未注册的 route: ${settings.name}');
        }
        return route;
      },
    );
  }
}
