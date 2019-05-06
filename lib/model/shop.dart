import 'package:hair/model/Barber.dart';

class Shop {
  final String id;
  final String name;
  final String address;
  final String avatar;
  final num status;
  final num score; //+ 店铺评分
  final num level; // 店铺等级
  final num orderCount; //+店铺总单数
  final String registTime;
  final String lastModify;
  final List<Barber> barberList; //一个店铺对应多个理发师

  Shop({
    this.id,
    this.name,
    this.address,
    this.avatar,
    this.status,
    this.level,
    this.orderCount,
    this.score,
    this.registTime,
    this.lastModify,
    this.barberList,
  }); //0:闭店 1：正常营业

  Shop copyWith({
    String id,
    String name,
    String address,
    String avatar,
    String status,
    num level,
    num score,
    num orderCount,
    String registTime,
    String lastModify,
    List<Barber> barberList,
  }) {
    return Shop(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
      level: level ?? this.level,
      orderCount: orderCount ?? this.orderCount,
      score: score ?? this.score,
      registTime: registTime ?? this.registTime,
      lastModify: lastModify ?? this.lastModify,
      barberList: barberList ?? this.barberList,
    );
  }

  static List<Shop> fromObjList(obj) {
    List<Shop> shopList = [];

    for (var item in obj) {
      List<Barber> barberList = [];
      if (item['barber'] != null) {
        for (var barber in item['barber']) {
          barberList.add(Barber.fromObj(barber));
        }
      }
      shopList.add(Shop(
        id: item['id'] ?? '',
        name: item['name'] ?? '',
        avatar: item['avatar'] ?? '',
        status: item['status'] ?? '',
        address: item['address'] ?? '',
        level: item['level'] ?? 0,
        orderCount: item['order_count'] ?? 0,
        score: item['score'] ?? 0.0,
        registTime: item['regist_time'] ?? '',
        lastModify: item['last_modify'] ?? '',
        barberList: barberList,
      ));
    }
    return shopList;
  }

  @override
  String toString() {
    return 'Shop{id: $id, name: $name, address: $address, avatar: $avatar, status: $status, score: $score, level: $level, orderCount: $orderCount, registTime: $registTime, lastModify: $lastModify, barberList: $barberList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Shop &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          address == other.address &&
          avatar == other.avatar &&
          status == other.status &&
          score == other.score &&
          level == other.level &&
          orderCount == other.orderCount &&
          registTime == other.registTime &&
          lastModify == other.lastModify &&
          barberList == other.barberList;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      address.hashCode ^
      avatar.hashCode ^
      status.hashCode ^
      score.hashCode ^
      level.hashCode ^
      orderCount.hashCode ^
      registTime.hashCode ^
      lastModify.hashCode ^
      barberList.hashCode;
}
