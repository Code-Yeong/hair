class Address {
  final String id;
  final String cusId;
  final String name;
  final String phone;
  final String address;
  final String status; // 1 唯一默认地址 0其他
  final String modifyTime;
  final String description;

  Address({this.id, this.cusId, this.name, this.phone, this.address, this.status, this.modifyTime, this.description});
  factory Address.fromObj(obj) {
    return Address(
      id: obj['id'].toString() ?? '',
      cusId: obj['cusId'].toString() ?? '',
      description: obj['description'].toString() ?? '',
      name: obj['name'].toString() ?? '',
      phone: obj['phone'].toString() ?? '',
      address: obj['address'].toString() ?? '',
      status: obj['status'].toString() ?? '',
      modifyTime: obj['midifyTime'].toString() ?? '',
    );
  }

  static List<Address> fromObjList(obj) {
    List<Address> list = [];
    print(obj);
    for (var item in obj) {
      list.add(Address(
        id: item['id'].toString() ?? '',
        cusId: item['cusId'].toString() ?? '',
        description: item['description'].toString() ?? '',
        name: item['name'].toString() ?? '',
        phone: item['phone'].toString() ?? '',
        address: item['address'].toString() ?? '',
        status: item['status'].toString() ?? '',
        modifyTime: item['midifyTime'].toString() ?? '',
      ));
    }
    return list;
  }

  @override
  String toString() {
    return 'Address{id: $id,cusId: $cusId, description: $description, name: $name, phone: $phone, address: $address, status: $status, midifyTime: $modifyTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          cusId == other.cusId &&
          description == other.description &&
          name == other.name &&
          phone == other.phone &&
          address == other.address &&
          status == other.status &&
          modifyTime == other.modifyTime;

  @override
  int get hashCode =>
      id.hashCode ^ cusId.hashCode ^ description.hashCode ^ name.hashCode ^ phone.hashCode ^ address.hashCode ^ status.hashCode ^ modifyTime.hashCode;
}
