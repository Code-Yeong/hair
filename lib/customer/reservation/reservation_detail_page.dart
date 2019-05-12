import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/customer/reservation/reservation_page_view_model.dart';
import 'package:hair/customer/reservation/time_zone.dart';
import 'package:hair/customer/reservation_comment/reservation_coment_page.dart';
import 'package:hair/model/dart.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';
import 'package:latlong/latlong.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class ReservationDetailPage extends StatefulWidget {
  ReservationDetailPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<ReservationDetailPage> {
  final PageController pageController = PageController(initialPage: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(51.5, -0.09),
        builder: (ctx) => Container(
              child: FlutterLogo(),
            ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(53.3498, -6.2603),
        builder: (ctx) => Container(
              child: FlutterLogo(
                colors: Colors.green,
              ),
            ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(48.8566, 2.3522),
        builder: (ctx) => Container(
              child: FlutterLogo(colors: Colors.purple),
            ),
      ),
    ];
    Reservation reservation = globalStore.state.reservationState.findById(globalStore.state?.reservationState?.selectedReservationId);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        title: Text(
          '${reservation?.staffName ?? "sf"}',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CommonColors.bgGray,
        elevation: 1.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              showDialog<Null>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return new AlertDialog(
                    title: new Text('提示'),
                    content: new SingleChildScrollView(
                      child: new Text(
                        '确认取消预约单吗？',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('点错了'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      new FlatButton(
                        child: new Text(
                          '确定',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          globalStore.dispatch(SBeginEditReservationStatusAction(status: '5', resId: reservation.rId, role: Role.customer));
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 12.0, bottom: 16.0),
              child: Text(
                '取消预约',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
            ),
          )
        ],
      ),
      body: StoreConnector<AppState, ReservationPageViewModel>(
        onInit: (store) {},
        converter: (store) => ReservationPageViewModel.fromStore(store),
        builder: (context, viewModel) => timelineModel(TimelinePosition.Left, markers, viewModel),
      ),
    );
  }

  List<Doodle> _buildDoodles(markers, ReservationPageViewModel viewModel) {
    List<Doodle> list = [];
    bool finished = false;
    Reservation reservation = viewModel.selectedReservation;
    if (reservation == null) {
      return list;
    }
    int status = int.parse(reservation?.status ?? 0);
    if (status > 2) {
      finished = true;
    }
    for (int i = 0; i <= status; i++) {
      if (status == 5) {
        if (i == 2 || i == 3 || i == 4) {
          continue;
        }
      }
      print('finished:$finished');
      if (i == 1) {
        list.add(Doodle(
          title: OrderStatusValue[i],
          time: DateTimeUtils.formatTimeForStr(time: reservation.createTime),
          child: Container(
            width: double.infinity,
            height: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '服务码:',
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    viewModel.selectedReservation?.code,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '理发师上门前请勿提供',
                  ),
                ),
              ],
            ),
          ),
          icon: i == status && !finished
              ? Icon(
                  Icons.directions_run,
                  color: Colors.red,
                  size: 20.0,
                )
              : Icon(Icons.check, color: Colors.white),
          iconBackground: i == status && !finished ? Colors.white : Colors.cyan,
        ));
      } else if (i == 2) {
        list.add(
          Doodle(
            title: OrderStatusValue[i],
            time: DateTimeUtils.formatTimeForStr(time: reservation.createTime),
            child: Container(
              width: double.infinity,
              height: 150.0,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text('${reservation.staffName}${statusText[i]}'),
                  ),
                  Expanded(
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(51.5, -0.09),
                        zoom: 5.0,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayerOptions(markers: markers)
                      ],
                    ),
                  )
                ],
              ),
            ),
            icon: i == status && !finished
                ? Icon(
                    Icons.directions_run,
                    color: Colors.red,
                    size: 20.0,
                  )
                : Icon(Icons.check, color: Colors.white),
            iconBackground: i == status && !finished ? Colors.white : Colors.cyan,
          ),
        );
      } else if (i == 3) {
        list.add(
          Doodle(
            title: OrderStatusValue[i],
            time: DateTimeUtils.formatTimeForStr(time: reservation.createTime),
            child: Container(
              width: double.infinity,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(i == 4 ? viewModel.selectedReservation?.comment : statusText[i]),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 30.0,
                    child: BottomOneButton(
                      title: '去评价',
                      fontSize: 14.0,
                      onTap: () {
//                                  GlobalNavigator.shared.pushNamed(StaffRoute.reservationComment);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ReservationComment(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            icon: i == status && !finished
                ? Icon(
                    Icons.directions_run,
                    color: Colors.red,
                    size: 20.0,
                  )
                : Icon(Icons.check, color: Colors.white),
            iconBackground: i == status && !finished ? Colors.white : Colors.cyan,
          ),
        );
      } else {
        list.add(
          Doodle(
            title: OrderStatusValue[i],
            time: DateTimeUtils.formatTimeForStr(time: reservation.createTime),
            child: Container(
              width: double.infinity,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(i == 4 ? viewModel.selectedReservation?.comment : statusText[i]),
                    ),
                  ),
                ],
              ),
            ),
            icon: i == status && !finished
                ? Icon(
                    Icons.directions_run,
                    color: Colors.red,
                    size: 20.0,
                  )
                : Icon(Icons.check, color: Colors.white),
            iconBackground: i == status && !finished ? Colors.white : Colors.cyan,
          ),
        );
      }
    }
    return list;
  }

  List<Doodle> doodles;
  timelineModel(TimelinePosition position, markers, ReservationPageViewModel viewModel) {
    doodles = _buildDoodles(markers, viewModel);
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
