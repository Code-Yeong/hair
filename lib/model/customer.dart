import 'package:hair/model/address.dart';

class Customer {
  final String id;
  final String name;
  final String nickName;
  final String phone;
  final String password;
  final String avator;
  final int status; // default:1,  0:非正常
  final int level; // default:1 ..5
  final int gender; //0 male 1 female
  final num score;
  final num money;
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
  factory Customer.fromObj(obj) {
    return Customer(
      id: obj['_id'].toString() ?? '',
      name: obj['name'] ?? '',
      nickName: obj['nick_name'] ?? '',
      phone: obj['phone'] ?? '',
      password: obj['password'] ?? '',
      avator: obj['avatar'] ?? '',
      status: obj['status'] ?? 1,
      level: obj['level'] ?? 1,
      gender: obj['sex'] ?? 0,
      score: obj['score'] ?? 0.0,
      money: obj['money'] ?? 0.0,
      registTime: obj['regist_time'] ?? '',
      lastModify: obj['last_modify'] ?? '',
      lastLogin: obj['last_login'] ?? '',
      description: obj['description'] ?? '',
      addrList: Address.fromObjList(obj['address']) ?? [],
    );
  }

  Customer copyWith({
    String id,
    String name,
    String nickName,
    String phone,
    String password,
    String avator,
    int status, // default:1,  0:非正常
    int level, // default:1 ..5
    int gender, //0 male 1 female
    double score,
    double money,
    String registTime,
    String lastModify,
    String lastLogin,
    String description,
    List<Address> addrList,
  }) {
//    print("Customer类：$addrList");
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      avator: avator ?? this.avator,
      status: status ?? this.status,
      level: level ?? this.level,
      gender: gender ?? this.gender,
      score: score ?? this.score,
      money: money ?? this.money,
      registTime: registTime ?? this.registTime,
      lastModify: lastModify ?? this.lastModify,
      lastLogin: lastLogin ?? this.lastLogin,
      description: description ?? this.description,
      addrList: addrList ?? this.addrList,
    );
  }

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
