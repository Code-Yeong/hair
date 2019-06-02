import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/comment_item_widget.dart';
import 'package:hair/model/comment.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/staff_reservation/s_reservation_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';

class BarberCommentPage extends StatefulWidget {
  final String barberId;
  final String shopAvatar; //顶部封面用
  final String barberAvatar; //顶部封面用
  final String barberName; //顶部封面用

  BarberCommentPage({this.barberId, this.shopAvatar, this.barberAvatar, this.barberName});

  @override
  _BarberCommentPageState createState() => _BarberCommentPageState();
}

class _BarberCommentPageState extends State<BarberCommentPage> {
  @override
  Widget build(BuildContext context) {
    String cusId = globalStore.state.cusInfoState?.customer?.id ?? '';
    print('ltnth:${globalStore.state.cusInfoState?.customer}');
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, List<Comment>>(
          onInit: (store) => store.dispatch(new FetchBarberCommentAction(barberId: widget.barberId)),
          converter: (store) => store.state.sReservationState.barberCommentList,
          builder: (_, viewModel) {
            return Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: CommonColors.bgGray,
                    pinned: true,
//                title: Text('我的信息'),
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        '${widget.barberName}',
                        style: TextStyle(color: Colors.black),
                      ),
                      background: Stack(
                        children: <Widget>[
                          Image.asset(
                            '${widget.shopAvatar}',
                            fit: BoxFit.cover,
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Container(
                              color: CommonColors.bgGray.withOpacity(0.3),
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            bottom: 40.0,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                '${widget.barberAvatar}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    expandedHeight: 300.0,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        Comment comment = viewModel[index];
                        print(comment);
                        return Container(
                          margin: EdgeInsets.all(16.0),
                          color: Colors.white,
                          child: CommentItemWidget(
                            rId: comment.rId,
                            name: comment.cusName,
                            serveName: comment.serveName,
                            starCount: comment.starCount,
                            avatar: comment.cusAvatar,
                            sex: comment.cusSex,
                            comment: comment.content,
                            time: comment.commentTime,
                            deletable: comment.cusId == cusId,
                          ),
                        );
                      },
                      childCount: viewModel.length,
                    ),
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
