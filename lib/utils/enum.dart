const List<String> OrderStatusValue = ['已创建', '等待接单', '已接单', '已联系', '已到达', '上传成功', '已完成'];

enum OrderStatus {
  create, //订单创建
  waiting, //等待接单
  received, //已接单
  contacted, //已联系客户
  arrived, //已到达
  uploaded, //上传服务凭证
  finished, //订单完成
}

OrderStatus buildOrderStatus(int value) {
  return OrderStatus.values[value];
}
