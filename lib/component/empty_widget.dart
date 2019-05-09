import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  EmptyWidget({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/sadly.png"),
            SizedBox(height: 8.0),
            Text(
              "$text",
              style: TextStyle(color: Colors.grey.withOpacity(0.3), fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
