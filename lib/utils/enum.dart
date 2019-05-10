const List<String> OrderStatusValue = ['创建订单', '待服务', '进行中', '待评价', '已评价', '已取消'];

enum OrderStatus {
  created, //创建订单 0
  waiting, //待服务 1
  processing, //进行中 2
  commenting, //已完成待评价 3
  commented, //已完成已评价 4
  canceled, //已取消 5
}

OrderStatus buildOrderStatusType(int value) {
  return OrderStatus.values[value];
}

String getOrderStatusText(OrderStatus status) {
  String text = '';
  switch (status) {
    case OrderStatus.created:
      text = '创建订单';
      break;
    case OrderStatus.waiting:
      text = '待服务';
      break;
    case OrderStatus.processing:
      text = '进行中';
      break;
    case OrderStatus.commenting:
      text = '待评价';
      break;
    case OrderStatus.commented:
      text = '已评价';
      break;
    case OrderStatus.canceled:
      text = '已取消';
      break;
  }
  return text;
}

enum LoadingStatus {
  init,
  loading,
  success,
  failed,
}

enum Role {
  customer,
  barber,
  shop,
}

List<String> timeArea = [
  '10:00-12:00',
  '12:00-14:00',
  '14:00-16:00',
  '16:00-18:00',
  '18:00-20:00',
];
