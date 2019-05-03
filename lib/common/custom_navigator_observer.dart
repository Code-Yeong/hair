import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  // 使用不同的方法 push pop, didPush方法的调用不是被期望的, 故不适用
  @override
  void didPush(Route route, Route previousRoute) {
//    if (route is TEPageRoute && previousRoute is TEPageRoute) {
//      TEGlobalNavigator.shared.setNewPage(route.name);
//    }
    _changeRoute(pushedRoute: route, poppedRoute: previousRoute);

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    final String newRouteName = previousRoute.settings.name;
    _changeRoute(pushedRoute: previousRoute, poppedRoute: route);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
//    TEGlobalNavigator.shared.setNewPage(newRoute.settings.name);
    _changeRoute(pushedRoute: newRoute, poppedRoute: oldRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    _changeRoute(pushedRoute: null, poppedRoute: route);

    super.didRemove(route, previousRoute);
  }

  void _changeRoute({Route pushedRoute, Route poppedRoute}) {}
}
