import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/address_item_widget.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/customer/info/user_info_page_view_model.dart';
import 'package:hair/model/address.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/choose_reservation_time/choose_reservation_time_action.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';

class UserAddressPage extends StatefulWidget {
  @override
  State createState() => UserAddressPageState();
}

class UserAddressPageState extends State<UserAddressPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "我的地址",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData.fallback(),
          backgroundColor: CommonColors.bgGray,
          elevation: 1.0,
        ),
        body: StoreConnector<AppState, UserInfoPageViewModel>(
            converter: (store) => UserInfoPageViewModel.fromStore(store),
            builder: (context, model) {
              print("修改修改：${model?.addressList}");
              return Container(
                padding: EdgeInsets.only(bottom: 12.0),
                color: CommonColors.bgGray,
                child: Column(children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      itemCount: model?.addressList?.length,
                      itemBuilder: (context, index) {
                        Address addr = model?.addressList[index];
                        return GestureDetector(
                          onTap: () {
                            print("快来看看！enableOnTapPop${globalStore.state.chooseReservationTimeState.enableOnTapPop}");
                            if (globalStore.state.chooseReservationTimeState.enableOnTapPop) {
                              globalStore.dispatch(EditCusAddressInfoAction(
                                  address: Address(
                                id: addr?.id,
                                cusId: globalStore.state.cusInfoState?.customer?.id,
                                status: '2',
                                name: addr?.name,
                                phone: addr?.phone,
                                address: addr?.address,
                                description: addr?.description,
                              )));
                              globalStore.dispatch(SetAddressAction(enableOnTapPop: false));
                            }
                          },
                          child: AddressItemWidget(
                            id: addr?.id,
                            username: addr?.name,
                            phone: addr?.phone,
                            address: addr?.address,
                            selected: addr?.status == '2',
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 0.0,
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 50.0,
                    child: BottomOneButton(
                      title: '新增地址',
                      onTap: () {
                        GlobalNavigator.shared.pushNamed(CustomerRoute.userAddressEditPage);
                      },
                    ),
                  ),
                ]),
              );
            }),
      ),
    );
  }
}
