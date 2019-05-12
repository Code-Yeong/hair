import 'package:flutter/material.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';

typedef VoidCallback OnOkButtonPressed(String s);

class PPBDialog extends StatefulWidget {
  final String resId;
  final Widget image;
  final Text title;
  final Text description;
  final Text errorText;
  final bool onlyOkButton;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final double buttonRadius;
  final double cornerRadius;
  final OnOkButtonPressed onOkButtonPressed;

  PPBDialog({
    Key key,
    this.image,
    this.title,
    this.onOkButtonPressed,
    this.resId,
    this.description,
    this.errorText,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor,
    this.buttonCancelColor,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  });

  @override
  State createState() => PPBDialogState();
}

class PPBDialogState extends State<PPBDialog> {
  bool errorVisible = false;
  String code;
  @override
  Widget build(BuildContext context) {
    print("in the dialog, errorText=${widget.errorText}");
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.cornerRadius)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: widget.title,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                  child: widget.description,
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 26.0, color: Colors.black),
                    maxLines: 1,
                    maxLength: 4,
                    onChanged: (v) {
                      code = v.trim();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                  child: errorVisible ? Text('验证失败', style: TextStyle(color: Colors.redAccent)) : Text(''),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: !widget.onlyOkButton ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                children: <Widget>[
                  !widget.onlyOkButton
                      ? RaisedButton(
                          color: widget.buttonCancelColor ?? Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.buttonRadius)),
                          onPressed: () => Navigator.of(context).pop(),
                          child: widget.buttonCancelText ??
                              Text(
                                '取消',
                                style: TextStyle(color: Colors.white),
                              ),
                        )
                      : Container(),
                  RaisedButton(
                    color: widget.buttonOkColor ?? Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.buttonRadius)),
                    onPressed: () {
                      String answer = globalStore.state.sReservationState.findById(widget.resId)?.code;
                      print("服务码是: $answer");
                      if (code == answer) {
//                      globalStore.dispatch(SBeginEditReservationStatusAction(status: '3'));
                        globalStore.dispatch(ReservationVerifyAction(resId: widget.resId));
                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          errorVisible = true;
                        });
                      }
                    },
                    child: widget.buttonOkText ??
                        Text(
                          '验证',
                          style: TextStyle(color: Colors.white),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
