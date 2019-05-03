import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/redux/store.dart';

import 'app.dart';

void main() {
  runZoned<Future<void>>(
    () async {
      //同步的初始化
      initialize();
      registerRoutes();

      runApp(App());
    },
    onError: (error, stackTrace) {
      print('dart_error: error: $error, stack: $stackTrace');
    },
  );
}

void initialize() async {
  createStore();
}
