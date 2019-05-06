class Shop {
  final String id;
  final String name;
  final String address;
  final String avatar;
  final num status;

  Shop({this.id, this.name, this.address, this.avatar, this.status}); //0:闭店 1：正常营业

  Shop copyWith({
    String id,
    String name,
    String address,
    String avatar,
    String status,
  }) {
    return Shop(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
    );
  }

  static List<Shop> fromObjList(obj) {
    List<Shop> shopList = [];
    for (var item in obj) {
      shopList.add(Shop(
        id: item['id'] ?? '',
        name: item['name'] ?? '',
        avatar: item['avatar'] ?? '',
        status: item['status'] ?? '',
        address: item['address'] ?? '',
      ));
    }
    return shopList;
  }

  @override
  String toString() {
    return 'Shop{id: $id, name: $name, address: $address, avatar: $avatar, status: $status}';
  }
}
