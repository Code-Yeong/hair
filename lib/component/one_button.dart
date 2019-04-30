import 'package:flutter/material.dart';

class BottomOneButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool disabled;
  BottomOneButton({this.onTap, this.title, this.disabled = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300.0,
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: disabled ? Colors.blueAccent.withOpacity(0.5) : Colors.blueAccent,
        ),
        child: Text(
          "$title",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }
}
