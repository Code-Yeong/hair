import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hair/common/login.dart';
import 'package:hair/redux/store.dart';

void main() {
  runZoned<Future<void>>(
    () async {
      //同步的初始化
      await initialize();
      print("2222");
      runApp(MainUI());
      print("3333");
    },
    onError: (error, stackTrace) {
      print('dart_error: error: $error, stack: $stackTrace');
    },
  );
}

void initialize() async {
  print("0000");
  createStore();
  print("1111");
}
