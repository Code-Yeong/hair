/*
 * Created by songfei on 11/20/18 2:03 PM
 * Copyright (c) 2018 Tencent
 *
 * Description:
 */

import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/login/login.dart';
import 'package:hair/common/login/signup_page.dart';
import 'package:hair/customer/choose_reservation_time/choose_reservation_time_page.dart';
import 'package:hair/customer/customer_home_page.dart';
import 'package:hair/customer/info/user_address_edit_page.dart';
import 'package:hair/customer/info/user_address_page.dart';
import 'package:hair/customer/reservation/reservation_detail_page.dart';
import 'package:hair/customer/shop/show_detail_page.dart';
import 'package:hair/staff/staff_home_page.dart';

void registerRoutes() {
  MainRoute.registerPageRoute();
  CustomerRoute.registerPageRoute();
  StaffRoute.registerPageRoute();
}

class MainRoute {
  static const String loginPage = 'login';
  static const String signupPage = 'signupPage';

  static void registerPageRoute() {
    GlobalNavigator.shared.registerPageRoutes({
      loginPage: (context) => LoginPage(), //轮播页面
      signupPage: (_) => SignupPage(),
    });
  }
}

///"客户"页面
class CustomerRoute {
  static const String shopDetailPage = 'shopDetailPage';
  static const String customerHomePage = 'customerHomePage';
  static const String showShopDetailPage = 'showShopDetailPage';
  static const String chooseReservationTimePage = 'chooseReservationTimePage';
  static const String userAddressPage = 'userAddressPage';
  static const String userAddressEditPage = 'userAddressEditPage';
  static const String reservationDetailPage = 'reservationDetailPage';
  static void registerPageRoute() {
    GlobalNavigator.shared.registerPageRoutes({
      shopDetailPage: (context) => ShopDetailPage(),
      customerHomePage: (context) => CustomerHomePage(),
      showShopDetailPage: (_) => ShopDetailPage(),
      chooseReservationTimePage: (_) => ChooseReservationTimePage(),
      userAddressPage: (_) => UserAddressPage(),
      userAddressEditPage: (_) => UserAddressEditPage(addPage: true),
      reservationDetailPage: (_) => ReservationDetailPage(),
    });
  }
}

///'理发师'页面
class StaffRoute {
  static const String staffHomePage = 'staffHomePage';
  static void registerPageRoute() {
    GlobalNavigator.shared.registerPageRoutes({
      staffHomePage: (_) => StaffHomePage(),
    });
  }
}
