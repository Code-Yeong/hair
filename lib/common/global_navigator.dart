import 'package:flutter/material.dart';

class GlobalNavigator {
  static GlobalNavigator get shared {
    return _shared;
  }

  /// 这个 Navigator 是给用户的界面用的
  static final globalNavigatorKey = GlobalKey<NavigatorState>();

  /// 这个 Navigator 是给系统的弹框（如: Alert 等) 用的
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// 禁止按 Android 的返回键执行 pop 操作
  bool disablePop = false;

  /// 初始页面
  String initialPage = '';

  String get currentPage {
    return _currentPage;
  }

  String _currentPage;
  bool _needRecordPop = true;
  Map<String, String> _tabPage = Map();

  bool _fullscreenDialog = false;
  bool _maintainState = true;
  bool _animated = true;

  NavigatorState get _navigatorState {
    return globalNavigatorKey.currentState;
  }

  // 参数
  Map<String, dynamic> _params;

  static GlobalNavigator _shared = GlobalNavigator();

//  /// 注册单个route
//  void registerPageRoute({String name, PageBuilder builder}) {
//    _routes[name] = builder;
//  }
//
//  /// 批量注册route: 需要传入map<routeName: PageBuilder>
//  void registerPageRoutes(Map<String, PageBuilder> routes) {
//    routes.forEach((name, builder) {
//      _routes[name] = builder;
//    });
//  }

  void setPushParams({
    bool fullscreenDialog = false,
    bool maintainState = true,
    bool animated = true,
    Map<String, dynamic> params,
  }) {
    _fullscreenDialog = fullscreenDialog;
    _maintainState = maintainState;
    _animated = animated;
    _params = params;
  }

  void _resetParamsState() {
    _fullscreenDialog = false;
    _maintainState = true;
    _animated = true;
    _params = null;
  }

  Future<T> pushNamed<T extends Object>(
    String name, {
    bool fullscreenDialog = false,
    bool maintainState = true,
    bool animated = true,
    Map<String, dynamic> params,
  }) {
    setPushParams(
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      animated: animated,
      params: params,
    );
//    setNewPage(name);
    return _navigatorState.pushNamed<T>(name);
  }

  @optionalTypeArgs
  Future<T> pushNamedAndRemoveUntil<T extends Object>(
    String name,
    RoutePredicate predicate, {
    bool fullscreenDialog = false,
    bool animated = true,
    bool maintainState = true,
    Map<String, dynamic> params,
  }) {
    setPushParams(
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      animated: animated,
      params: params,
    );
//    setNewPage(name);
    return _navigatorState.pushNamedAndRemoveUntil<T>(name, predicate);
  }

  @optionalTypeArgs
  Future<T> pushReplacementNamed<T extends Object, TO extends Object>(
    String name, {
    bool fullscreenDialog = false,
    bool animated = true,
    bool maintainState = true,
    Map<String, dynamic> params,
  }) {
    setPushParams(
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      animated: animated,
      params: params,
    );
//    setNewPage(name);
    return _navigatorState.pushReplacementNamed<T, TO>(name);
  }

  @optionalTypeArgs
  Future<T> popAndPushNamed<T extends Object, TO extends Object>(
    String name, {
    bool fullscreenDialog = false,
    bool maintainState = true,
    Map<String, dynamic> params,
  }) {
    setPushParams(fullscreenDialog: fullscreenDialog, maintainState: maintainState, params: params);
//    setNewPage(name);
    return _navigatorState.popAndPushNamed(name);
  }

  @optionalTypeArgs
  bool pop<T extends Object>([T result]) {
    return _navigatorState.pop(result);
  }

  bool canPop() {
    return _navigatorState.canPop();
  }

  @optionalTypeArgs
  Future<bool> maybePop<T extends Object>([T result]) async {
    return _navigatorState.maybePop(result);
  }

  void popUntilNamed(String name) {
    _needRecordPop = false;
    _navigatorState.popUntil(ModalRoute.withName(name));
    _needRecordPop = true;
//    setPopNewPage(name);
  }

//  void setPopNewPage(String newPageName) {
//    if (_needRecordPop) {
//      // pop until 时 navigator中的pop会多次调用
//      var newName = newPageName;
//      if (newName == MainRoute.studentPage || newName == MainRoute.teacherPage) {
//        // tab页面
//        newName = _tabPage[newPageName];
//      }
//      setNewPage(newName);
//    }
//  }

//  void setNewPage(String newPage) {
//    print('this is new: $newPage ------- old: $_currentPage');
//
//    _reportPageChangeData(oldPage: _currentPage, newPage: newPage);
//    _currentPage = newPage;
//
//    if (newPage == MainRoute.studentHomeTabs[0] || newPage == MainRoute.teacherHomeTabs[0]) {
//      TEShowCommentAlertManager.showCommentView();
//    }
//  }
//
//  void setNewTabPageName(String routeName, String pageName) {
//    _tabPage[routeName] = pageName;
//    setNewPage(pageName);
//  }

}
