import 'package:flutter/material.dart';
import 'package:hair/utils/common_colors.dart';

class TimeItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool disabled;
  final bool selected;
  TimeItemWidget({this.onTap, this.text, this.disabled = false, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buildColor(),
          border: Border.all(color: CommonColors.lineDividing),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        alignment: Alignment.center,
        child: Text(
          '$text',
          style: TextStyle(color: disabled ? buildColor() : Colors.black, fontSize: 14.0),
        ),
      ),
    );
  }

  Color buildColor() {
    if (selected) {
      return Colors.blueAccent;
    } else if (disabled) {
      return CommonColors.textLightGray.withOpacity(0.5);
    }
    return Colors.white;
  }
}
