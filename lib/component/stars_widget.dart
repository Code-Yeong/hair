import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  final double score;
  final double starWidth;
  StarsWidget({this.score, this.starWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(getIcon(1), color: score.ceil() >= 1 ? Color(0xFFF5A623) : Colors.grey.withOpacity(0.6), size: starWidth),
          Icon(getIcon(2), color: score.ceil() >= 2 ? Color(0xFFF5A623) : Colors.grey.withOpacity(0.6), size: starWidth),
          Icon(getIcon(3), color: score.ceil() >= 3 ? Color(0xFFF5A623) : Colors.grey.withOpacity(0.6), size: starWidth),
          Icon(getIcon(4), color: score.ceil() >= 4 ? Color(0xFFF5A623) : Colors.grey.withOpacity(0.6), size: starWidth),
          Icon(getIcon(5), color: score.ceil() >= 5 ? Color(0xFFF5A623) : Colors.grey.withOpacity(0.6), size: starWidth),
        ],
      ),
    );
  }

  IconData getIcon(int starIndexNumber) {
    int floor = score.floor();
    int ceil = score.ceil();
    if (starIndexNumber <= floor) {
      return Icons.star;
    } else if (starIndexNumber > ceil) {
      return Icons.star_border;
    } else if (starIndexNumber == ceil && starIndexNumber != score) {
      return Icons.star_half;
    }
    return null;
  }
}
