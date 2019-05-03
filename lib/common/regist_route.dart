/*
 * Created by songfei on 11/20/18 2:03 PM
 * Copyright (c) 2018 Tencent
 *
 * Description:
 */

import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/login.dart';
import 'package:hair/customer/customer_home_page.dart';
import 'package:hair/customer/show_detail_page.dart';

void registerRoutes() {
  MainRoute.registerPageRoute();
  CustomerRoute.registerPageRoute();
  StaffRoute.registerPageRoute();
}

class MainRoute {
  static const String loginPage = 'login';

  static void registerPageRoute() {
    GlobalNavigator.shared.registerPageRoutes({
      loginPage: (context) => LoginPage(), //轮播页面
    });
  }
}

///"客户"页面
class CustomerRoute {
  static const String shopDetailPage = 'shopDetailPage';
  static const String customerHomePage = 'customerHomePage';
  static const String showShopDetailPage = 'showShopDetailPage';
  static void registerPageRoute() {
    GlobalNavigator.shared.registerPageRoutes({
      shopDetailPage: (context) => ShopDetailPage(),
      customerHomePage: (context) => CustomerHomePage(),
      showShopDetailPage: (_) => ShopDetailPage(),
    });
  }
}

///'理发师'页面
class StaffRoute {
  static void registerPageRoute() {}
}
