import 'package:hair/model/address.dart';

class Customer {
  final String id;
  final String name;
  final String nickName;
  final String phone;
  final String password;
  final String avator;
  final int status;
  final int level;
  final int gender; //0 male 1 female
  final double score;
  final double money;
  final String registTime;
  final String lastModify;
  final String lastLogin;
  final String description;

  final List<Address> addrList;

  Customer({
    this.id,
    this.name,
    this.nickName,
    this.phone,
    this.password,
    this.avator,
    this.status,
    this.level,
    this.gender,
    this.score,
    this.money,
    this.registTime,
    this.lastModify,
    this.lastLogin,
    this.description,
    this.addrList,
  });

  @override
  String toString() {
    return 'Customer{id: $id, name: $name, nickName: $nickName, phone: $phone, password: $password, avator: $avator, status: $status, level: $level, gender: $gender, score: $score, money: $money, registTime: $registTime, lastModify: $lastModify, lastLogin: $lastLogin, description: $description, addrList: $addrList}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Customer &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          nickName == other.nickName &&
          phone == other.phone &&
          password == other.password &&
          avator == other.avator &&
          status == other.status &&
          level == other.level &&
          gender == other.gender &&
          score == other.score &&
          money == other.money &&
          registTime == other.registTime &&
          lastModify == other.lastModify &&
          lastLogin == other.lastLogin &&
          description == other.description &&
          addrList == other.addrList;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      nickName.hashCode ^
      phone.hashCode ^
      password.hashCode ^
      avator.hashCode ^
      status.hashCode ^
      level.hashCode ^
      gender.hashCode ^
      score.hashCode ^
      money.hashCode ^
      registTime.hashCode ^
      lastModify.hashCode ^
      lastLogin.hashCode ^
      description.hashCode ^
      addrList.hashCode;
}
