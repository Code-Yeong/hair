class Address {
  final String id;
  final String address;
  final String name;
  final String phone;
  final String description;
  final String status; // 1 唯一默认地址 0其他

  Address({
    this.id,
    this.address,
    this.phone,
    this.description,
    this.name,
    this.status,
  });

  @override
  String toString() {
    return 'Address{id: $id, address: $address, name: $name, phone: $phone, description: $description, status: $status}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          address == other.address &&
          name == other.name &&
          phone == other.phone &&
          description == other.description &&
          status == other.status;

  @override
  int get hashCode =>
      id.hashCode ^
      address.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      description.hashCode ^
      status.hashCode;
}
