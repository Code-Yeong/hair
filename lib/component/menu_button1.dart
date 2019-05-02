import 'package:flutter/material.dart';
import 'package:hair/utils/common_colors.dart';

typedef ItemSelected(num value);

class MenuButton1 extends StatelessWidget {
  final ItemSelected onTap;
  final String title;
  final num index;
  final bool selected;
  final Color activatedColor;
  final Color activatedTextColor;
  final Color defaultColor;
  final Color defaultTextColor;

  MenuButton1({
    this.onTap,
    this.title,
    this.index,
    this.selected = false,
    this.activatedColor = Colors.blueGrey,
    this.activatedTextColor = Colors.black54,
    this.defaultColor = CommonColors.bgGray,
    this.defaultTextColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          color: selected ? activatedColor : defaultColor,
        ),
        child: Text(
          "$title",
          style: TextStyle(
            color: selected ? activatedTextColor : defaultTextColor,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
