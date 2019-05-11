import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/customer/reservation_comment/reservation_comment_page_view_model.dart';
import 'package:hair/model/reservation.dart';
import 'package:hair/model/shop.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_reservation/reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReservationComment extends StatefulWidget {
  @override
  State createState() => ReservationCommentState();
}

class ReservationCommentState extends State<ReservationComment> {
  num barberScore = 0.0;
  num shopScore = 0.0;
  String barberComment;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          title: Text(
            "客户评价",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: CommonColors.bgGray,
          elevation: 1.0,
        ),
        body: StoreConnector<AppState, ReservationCommentPageViewModel>(
          onInit: (store) {},
          converter: (store) => ReservationCommentPageViewModel.fromStore(store),
          builder: (context, viewModel) {
            Shop shop = viewModel.getShop();
            Reservation reservation = viewModel.reservation;
            return Container(
              color: CommonColors.bgGray,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: reservation?.avatar == null ? null : NetworkImage('${reservation?.avatar}'),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${reservation?.staffName ?? '无名'}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(18.0),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "理发师评价",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (v) {
                            barberScore = v;
                            setState(() {});
                          },
                          starCount: 5,
                          rating: barberScore,
                          size: 40.0,
                          color: Colors.yellow,
                          borderColor: CommonColors.lineDividing,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 32.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: "在此输入您对理发师的评价",
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5,
                            onFieldSubmitted: (value) {
                              print('value:$value');
                              if (value.isEmpty) {
                                return "Empty value";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: shop?.avatar == null ? null : NetworkImage('${shop?.avatar}'),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${shop?.name ?? '无名'}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(18.0),
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "店铺评分",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (v) {
                            shopScore = v;
                            setState(() {});
                          },
                          starCount: 5,
                          rating: shopScore,
                          size: 40.0,
                          color: Colors.yellow,
                          borderColor: CommonColors.lineDividing,
                        ),
                      ],
                    ),
                  ),
                  BottomOneButton(
                    title: '提交',
                    onTap: () {
                      String text = controller?.text?.trim() ?? null;
                      if (shopScore * barberScore == 0 || text == null || text.length == 0) {
                        return;
                      }
                      globalStore.dispatch(CommentReservationAction(resId: reservation.rId, content: text, shopScore: shopScore, barberScore: barberScore));
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
