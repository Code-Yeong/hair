import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/component/time_item_widget.dart';
import 'package:hair/customer/choose_reservation_time/choose_reservation_time_view_model.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';

class ChooseReservationTimePage extends StatefulWidget {
  @override
  State createState() => _ChooseReservationTimePage();
}

class _ChooseReservationTimePage extends State<ChooseReservationTimePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData.fallback(),
            title: Text(
              "选择时间",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: CommonColors.bgGray,
            elevation: 1.0,
          ),
          body: StoreConnector<AppState, ChooseReservationTimeViewModel>(
            onInit: (store) {
              store.dispatch(new InitChooseReservationAction());
            },
            converter: (store) => ChooseReservationTimeViewModel.fromStore(store),
            builder: (context, viewModel) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: CustomScrollView(
                          slivers: <Widget>[
                            SliverToBoxAdapter(
                              child: GestureDetector(
                                onTap: () {
                                  print("未实现");
                                },
                                child: Container(
                                    color: CommonColors.textGray.withOpacity(0.1),
                                    padding: EdgeInsets.all(10.0),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            '地址:',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                        Icon(Icons.location_on, color: Colors.red),
                                        Text(
                                          '北京市海淀区马连洼',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    )),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                color: CommonColors.textGray.withOpacity(0.1),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '5月4日 星期三',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                width: double.infinity,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 48.0,
                                  shrinkWrap: true,
                                  children: buildTimeItemListBlock(viewModel, 1),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                color: CommonColors.textGray.withOpacity(0.1),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '5月5日 星期三',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                width: double.infinity,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 48.0,
                                  shrinkWrap: true,
                                  children: buildTimeItemListBlock(viewModel, 2),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                color: CommonColors.textGray.withOpacity(0.1),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '5月6日 星期三',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                width: double.infinity,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 48.0,
                                  shrinkWrap: true,
                                  children: buildTimeItemListBlock(viewModel, 3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      child: BottomOneButton(
                        title: '下单',
                        disabled: !viewModel.isSelectedTimeItem,
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  _selectedTime(String time) {
    globalStore.dispatch(new SelectedTimeItemAction(selectedTime: time));
  }

  List<Widget> buildTimeItemListBlock(ChooseReservationTimeViewModel viewModel, int block) {
    return <Widget>[
      TimeItemWidget(
        text: '10:00-12:00',
//        disabled: viewModel.isSelectedTimeItem,
        selected: viewModel.selectedTime == '$block-10:00-12:09',
        onTap: () {
          _selectedTime('$block-10:00-12:09');
        },
      ),
      TimeItemWidget(
        text: '12:00-14:00',
//        disabled: viewModel.isSelectedTimeItem,
        selected: viewModel.selectedTime == '$block-12:00-14:00',
        onTap: () {
          _selectedTime('$block-12:00-14:00');
        },
      ),
      TimeItemWidget(
        text: '14:00-16:00',
//        disabled: viewModel.isSelectedTimeItem,
        selected: viewModel.selectedTime == '$block-14:00-16:00',
        onTap: () {
          _selectedTime('$block-14:00-16:00');
        },
      ),
      TimeItemWidget(
        text: '16:00-18:00',
//        disabled: viewModel.isSelectedTimeItem,
        selected: viewModel.selectedTime == '$block-16:00-18:00',
        onTap: () {
          _selectedTime('$block-16:00-18:00');
        },
      ),
      TimeItemWidget(
        text: '18:00-20:00',
//        disabled: viewModel.isSelectedTimeItem,
        selected: viewModel.selectedTime == '$block-18:00-20:00',
        onTap: () {
          _selectedTime('$block-18:00-20:00');
        },
      ),
    ];
  }
}
