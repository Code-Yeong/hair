import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/model/barber.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/staff_info/staff_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/enum.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:redux/redux.dart';

class StaffVerifyPage extends StatefulWidget {
  @override
  _StaffVerifyPageState createState() => _StaffVerifyPageState();
}

class _StaffVerifyPageState extends State<StaffVerifyPage> {
  File _image;
  String _idCardNumber;
  String _name;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PageViewModel>(
      converter: (store) => PageViewModel.fromStore(store),
      builder: (context, viewModel) {
        return SafeArea(
          child: Scaffold(
              appBar: new AppBar(
                title: new Text('职业认证'),
                backgroundColor: Colors.blueGrey,
              ),
              body: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20.0,
                                height: 20.0,
                                child: Image.asset('assets/images/name.png'),
                              ),
                              SizedBox(width: 10.0),
                              Text('真实姓名', style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: viewModel.barber.status == 1
                              ? new TextField(
                                  onSubmitted: null,
                                  decoration: new InputDecoration.collapsed(
                                    hintText: '请输入真实姓名',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                                  maxLines: 1,
                                  onChanged: (str) {
                                    _name = str?.trim();
                                    setState(() {});
                                  },
                                )
                              : Text('  ${viewModel.barber.name}',
                                  style: TextStyle(fontSize: 18.0, color: Colors.black.withOpacity(0.4)), textAlign: TextAlign.start),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20.0,
                                height: 20.0,
                                child: Image.asset('assets/images/idcard.png'),
                              ),
                              SizedBox(width: 10.0),
                              Text('身份证号', style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: viewModel.barber.status == 1
                              ? TextField(
                                  onSubmitted: null,
                                  decoration: new InputDecoration.collapsed(
                                    hintText: '请输入18位身份证号',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                                  maxLines: 1,
                                  onChanged: (str) {
                                    _idCardNumber = str?.trim();
                                    setState(() {});
                                  },
                                )
                              : Text('  ${viewModel.barber.idCard}',
                                  style: TextStyle(fontSize: 18.0, color: Colors.black.withOpacity(0.4)), textAlign: TextAlign.start),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20.0,
                                height: 20.0,
                                child: Image.asset('assets/images/certificate.png'),
                              ),
                              SizedBox(width: 10.0),
                              Text('职业证书', style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (viewModel.barber.status == 2) {
                              return;
                            }

                            var image = await ImagePicker.pickImage(source: ImageSource.gallery);
                            setState(() {
                              _image = image;
                            });
                          },
                          child: Container(
                            width: 160.0,
                            height: 160.0,
                            padding: EdgeInsets.all(16.0),
                            margin: EdgeInsets.all(16.0),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey, width: 1.0),
                            ),
                            child: viewModel.barber.status == 1
                                ? (_image == null ? Image.asset('assets/images/plus.png') : Image.file(_image))
                                : Image.network(viewModel.barber.certificate),
                          ),
                        ),
                        viewModel.barber.status == 1
                            ? Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: BottomOneButton(
                                  title: '提交',
                                  disabled: _image == null || _name == null || !RegexUtil.isIDCard18(_idCardNumber),
                                  onTap: () {
                                    showDialog<Null>(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return new AlertDialog(
                                          title: new Text('提示'),
                                          content: new SingleChildScrollView(
                                            child: new Text(
                                              '确认提交吗？',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            new FlatButton(
                                              child: new Text('再改改'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            new FlatButton(
                                              child: new Text(
                                                '确定',
                                                style: TextStyle(color: Colors.red),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                globalStore.dispatch(BeginVerifyAction(idCard: _idCardNumber, name: _name, certificate: _image));
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  viewModel.status == LoadingStatus.loading
                      ? Container(
                          color: Colors.grey,
                          child: Center(
                            child: Loading(indicator: BallPulseIndicator(), size: 50.0),
                          ),
                        )
                      : Container(),
                ],
              )),
        );
      },
    );
  }
}

class PageViewModel {
  final Barber barber;
  final LoadingStatus status;

  PageViewModel({this.barber, this.status});

  static PageViewModel fromStore(Store<AppState> store) {
    return PageViewModel(
      barber: store.state.staffInfoState.barber,
      status: store.state.staffInfoState.loadingStatus,
    );
  }
}
