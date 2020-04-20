import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:hair/component/toast.dart';

Future<String> scanQrCode() async {
  try {
    ScanResult result = await BarcodeScanner.scan();
    String barcode = result.rawContent;
    showToast(text: "扫码成功");
    return barcode;
  } on PlatformException catch (e) {
    if (e.code == BarcodeScanner.cameraAccessDenied) {
      showToast(text: '请打开相机使用权限');
    } else {
      showToast(text: "扫码失败");
    }
  } on FormatException {
    showToast(text: "扫码失败");
  } catch (e) {
    showToast(text: "扫码失败");
  }
  return null;
}
