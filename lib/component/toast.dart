import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({@required String text}) async {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}
