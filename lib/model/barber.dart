class Barber {
  final String id;
  final String name;
  final String nickName;
  final String phone;
  final String password;
  final String avatar;
  final num status; //0:为认证 1:已认证 2：禁用
  final num level;
  final num sex;
  final num score;
  final num orderCount;
  final num money;
  final String address;
  final String shop;
  final String idCard;
  final String certificate;
  final num long; //经度
  final num alti; //纬度
  final String description;
  final String registTime;
  final String lastLogin;
  final String lastModify;

  Barber({
    this.id,
    this.name,
    this.nickName,
    this.phone,
    this.password,
    this.avatar,
    this.status,
    this.level,
    this.sex,
    this.score,
    this.money,
    this.orderCount,
    this.address,
    this.shop,
    this.idCard,
    this.certificate,
    this.long,
    this.alti,
    this.description,
    this.registTime,
    this.lastLogin,
    this.lastModify,
  });

  static Barber fromObj(obj) {
    print(obj);
    return Barber(
      id: obj['id'] ?? '',
      name: obj['name'] ?? '',
      nickName: obj['nick_name'] ?? '',
      phone: obj['phone'] ?? '',
      password: obj['password'] ?? '',
      avatar: obj['avatar'] ?? '',
      status: obj['status'] ?? 0,
      level: obj['level'] ?? 1,
      sex: obj['sex'] ?? 0,
      score: obj['score'] ?? 0,
      orderCount: obj['orderCount'] ?? 0,
      money: obj['money'] ?? 0,
      address: obj['address'] ?? '',
      shop: obj['shop'].toString() ?? '',
      idCard: obj['idcard'] ?? '',
      certificate: obj['certificate'] ?? '',
      long: obj['longitude'] ?? 0,
      alti: obj['altitude'] ?? 0,
      description: obj['description'] ?? '',
      registTime: obj['regist_time'] ?? '',
      lastModify: obj['last_modify'] ?? '',
      lastLogin: obj['last_login'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Barber{id: $id, name: $name, nickName: $nickName, phone: $phone, password: $password, avatar: $avatar, status: $status, level: $level,orderCount: $orderCount, sex: $sex, score: $score, money: $money, address: $address, shop: $shop, idCard: $idCard, certificate: $certificate, long: $long, alti: $alti, description: $description, registTime: $registTime, lastLogin: $lastLogin, lastModify: $lastModify}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Barber &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          nickName == other.nickName &&
          phone == other.phone &&
          orderCount == other.orderCount &&
          password == other.password &&
          avatar == other.avatar &&
          status == other.status &&
          level == other.level &&
          sex == other.sex &&
          score == other.score &&
          money == other.money &&
          address == other.address &&
          shop == other.shop &&
          idCard == other.idCard &&
          certificate == other.certificate &&
          long == other.long &&
          alti == other.alti &&
          description == other.description &&
          registTime == other.registTime &&
          lastLogin == other.lastLogin &&
          lastModify == other.lastModify;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      nickName.hashCode ^
      phone.hashCode ^
      orderCount.hashCode ^
      password.hashCode ^
      avatar.hashCode ^
      status.hashCode ^
      level.hashCode ^
      sex.hashCode ^
      score.hashCode ^
      money.hashCode ^
      address.hashCode ^
      shop.hashCode ^
      idCard.hashCode ^
      certificate.hashCode ^
      long.hashCode ^
      alti.hashCode ^
      description.hashCode ^
      registTime.hashCode ^
      lastLogin.hashCode ^
      lastModify.hashCode;
}
