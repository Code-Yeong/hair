import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/time_zone.dart';
import 'package:hair/model/dart.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/staff/reservation/staff_reservation_page_view_model.dart';
import 'package:hair/utils/enum.dart';
import 'package:latlong/latlong.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class StaffReservationDetailPage extends StatefulWidget {
  StaffReservationDetailPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<StaffReservationDetailPage> {
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
//    Reservation staffReservation = globalStore.state.reservationState.findById(globalStore.state?.reservationState?.selectedReservationId);
    Reservation staffReservation = globalStore.state.sReservationState.findById(globalStore.state?.sReservationState?.selectedSReservationId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${staffReservation?.staffName ?? ""}'),
      ),
      body: StoreConnector<AppState, StaffReservationPageViewModel>(
        onInit: (store) {},
        converter: (store) => StaffReservationPageViewModel.fromStore(store),
        builder: (context, viewModel) => timelineModel(TimelinePosition.Left, markers, viewModel),
      ),
    );
  }

  List<Doodle> _buildDoodles(markers, StaffReservationPageViewModel viewModel) {
    List<Doodle> list = [];
    Reservation staffReservation = viewModel.selectedReservation;
    if (staffReservation == null) {
      return list;
    }
    int status = int.parse(staffReservation?.status ?? 0);
    for (int i = 0; i <= status; i++) {
      list.add(
        Doodle(
          title: OrderStatusValue[i],
          time: DateTimeUtils.formatTimeForStr(time: staffReservation.createTime),
          child: Container(
            width: double.infinity,
            height: i == 1 ? 150.0 : 50,
            child: i == 1
                ? FlutterMap(
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
                  )
                : Text(OrderStatusValue[i]),
          ),
          icon: i == status
              ? Icon(
                  Icons.directions_run,
                  color: Colors.red,
                  size: 20.0,
                )
              : Icon(Icons.check, color: Colors.white),
          iconBackground: i == status ? Colors.white : Colors.cyan,
        ),
      );
    }
    return list;
  }

  List<Doodle> doodles;
  timelineModel(TimelinePosition position, markers, StaffReservationPageViewModel viewModel) {
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
