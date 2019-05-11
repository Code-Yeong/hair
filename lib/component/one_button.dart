import 'package:flutter/material.dart';

class BottomOneButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool disabled;
  final double fontSize;
  final num width;
  final Color color;
  final Color bgColor;
  final Color colorDisabled;
  final Color bgColorDisabled;

  BottomOneButton({
    this.onTap,
    this.title,
    this.fontSize = 18.0,
    this.disabled = false,
    this.color = Colors.white,
    this.bgColor = Colors.blueAccent,
    this.colorDisabled = Colors.white,
    this.bgColorDisabled = const Color(0x7F2979FF),
    this.width = 300.0,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        width: width,
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: disabled ? bgColorDisabled : bgColor,
        ),
        child: Text(
          "$title",
          style: TextStyle(
            color: disabled ? colorDisabled : color,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
