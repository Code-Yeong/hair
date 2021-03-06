import 'package:flutter/material.dart';
import 'package:hair/component/stars_widget.dart';
import 'package:hair/component/time_zone.dart';
import 'package:hair/component/toast.dart';

class CommentItemWidget extends StatelessWidget {
  final num rId;
  final String avatar;
  final String name;
  final String time;
  final String serveName;
  final num starCount;
  final String comment;
  final bool deletable;
  final num sex;

  CommentItemWidget({
    this.rId,
    this.avatar,
    this.name,
    this.time,
    this.sex,
    this.starCount,
    this.serveName,
    this.comment,
    this.deletable = false,
  });

  @override
  Widget build(BuildContext context) {
    print("user avarar:$starCount");
    return Container(
//      color: Colors.red,
      child: Column(
        children: <Widget>[
          Container(
//            height: 20.0,
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('$avatar'),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  height: 60.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${name ?? '匿名'}',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: time != null && time.length > 0 ? Text('${DateTimeUtils.formatTimeForStr(time: time)}') : Container(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 20.0, maxHeight: 80.0),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16.0),
            child: Text('$comment', style: TextStyle(fontSize: 18.0)),
          ),
          Container(
            height: 50.0,
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                StarsWidget(score: starCount ?? 0),
                GestureDetector(
                  onTap: () {
                    showToast(text: '删除评论，评论内容:$rId');
                  },
                  child: deletable
                      ? Text(
                          '删除',
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
