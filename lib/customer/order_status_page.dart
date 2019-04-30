import 'package:flutter/material.dart';
import 'package:hair/model/dart.dart';
import 'package:hair/utils/enum.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final PageController pageController = PageController(initialPage: 1, keepPage: true);
  int pageIx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: timelineModel(TimelinePosition.Left),
    );
  }

  List<Doodle> _buildDoodles() {
    List<Doodle> list = [];
    for (int i = 0; i < 7; i++) {
      list.add(
        Doodle(
          title: OrderStatusValue[i],
          time: "${DateTime.now()}",
          child: Container(
            child: Text('fdfdsfs'),
          ),
          icon: Icon(Icons.check, color: Colors.white),
          iconBackground: Colors.cyan,
        ),
      );
    }
    return list;
  }

  List<Doodle> doodles;
  timelineModel(TimelinePosition position) {
    doodles = _buildDoodles();
    return Timeline.builder(
      reverse: true,
      itemBuilder: centerTimelineBuilder,
      itemCount: doodles.length,
      physics: ClampingScrollPhysics(),
      position: position,
    );
  }

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final doodle = doodles[i];
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    doodle.title,
                    style: textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    doodle.time,
                    style: textTheme.subtitle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              doodle.child,
            ],
          ),
        ),
      ),
      position: i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
      isFirst: i == 0,
      isLast: i == doodles.length,
      iconBackground: doodle.iconBackground,
      icon: doodle.icon,
    );
  }
}
