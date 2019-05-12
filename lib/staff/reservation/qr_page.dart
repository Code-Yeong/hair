import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  @override
  State createState() => QrPageState();
}

class QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    final qrCode = new QrCode(4, QrErrorCorrectLevel.L);
    qrCode.addData("Hello, world in QR form!");
    qrCode.make();

    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black54,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 10.0, right: 10.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      QrImage(
                        backgroundColor: Colors.white,
                        data: "1234567890",
                        size: 200.0,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        color: Colors.white,
                        width: 200.0,
                        height: 30.0,
                        child: Text("请客户扫码,确认服务"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100.0)
              ],
            )),
      ),
    );
  }
}
