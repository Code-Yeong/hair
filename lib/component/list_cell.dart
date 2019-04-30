import 'package:flutter/material.dart';
import 'package:hair/utils/common_colors.dart';

class ListCell extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final String rightIcon;
  final double height;
  final double iconSize;
  final Widget child;
  final bool showDivider;

  ListCell({
    this.title,
    this.leadingIcon,
    this.rightIcon,
    this.height = 50.0,
    this.iconSize = 20.0,
    this.showDivider = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
//      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CommonColors.lineDividing.withOpacity(showDivider ? 1.0 : 0.0), width: showDivider ? 1.0 : 0.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: iconSize,
            height: iconSize,
            child: leadingIcon != null ? Image.asset(leadingIcon) : null,
          ),
          SizedBox(width: leadingIcon != null ? 4.0 : 0.0),
          Expanded(
            child: Container(
              child: Text(
                '$title',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Container(
            child: child,
          ),
          SizedBox(
            width: 4.0,
          ),
          Container(
            width: iconSize,
            height: iconSize,
            child: Image.asset(rightIcon ?? "assets/images/arrow_right_icon.png"),
          )
        ],
      ),
    );
  }
}
