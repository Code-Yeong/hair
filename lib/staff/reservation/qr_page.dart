import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:redux/redux.dart';

class QrPage extends StatefulWidget {
  @override
  State createState() => QrPageState();
}

class QrPageState extends State<QrPage> {
  Timer _timer;
  String _tipText = '请客户扫码,确认服务';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (t) async {
      globalStore.dispatch(new SQueryScanResultAction());
    });
  }

  @override
  Widget build(BuildContext context) {
    final qrCode = new QrCode(4, QrErrorCorrectLevel.L);
    qrCode.addData("Hello, world in QR form!");
    qrCode.make();

    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, QrPageViewModel>(
          converter: (store) => QrPageViewModel.fromStore(store),
          builder: (context, viewModel) {
            print('status:${viewModel.reservation.status}');
            if (viewModel.reservation.status == '3' && _timer.isActive) {
              _timer.cancel();
              _timer = null;
              _tipText = '扫码成功';
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).maybePop();
              });
            }
            var data = {
              'rid': viewModel.reservation.rId,
              'cusId': viewModel.reservation.cusId,
              'barberid': viewModel.reservation.barberId,
            };
            return Container(
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
                          data: json.encode(data),
                          size: 200.0,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          color: Colors.white,
                          width: 200.0,
                          height: 30.0,
                          child: Text(_tipText),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.0)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }
}

class QrPageViewModel {
  final Reservation reservation;
  QrPageViewModel({this.reservation});

  static QrPageViewModel fromStore(Store<AppState> store) {
    return QrPageViewModel(
      reservation: store.state.sReservationState.findById(store.state.sReservationState.selectedSReservationId),
    );
  }
}
