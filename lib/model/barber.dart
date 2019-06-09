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
  final String shopStatus; //0:未加入任何店铺， 1：正在申请加入店铺 2：申请通过
  final String idCard;
  final String certificate;
  final num long; //经度
  final num alti; //纬度
  final String description;
  final String registTime;
  final String lastLogin;
  final String submitTime; //申请加入店铺的时间
  final String admitTime; //申请通过的时间
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
    this.shopStatus,
    this.idCard,
    this.certificate,
    this.long,
    this.alti,
    this.description,
    this.registTime,
    this.lastLogin,
    this.lastModify,
    this.submitTime,
    this.admitTime,
  });

  static Barber fromObj(obj) {
//    print(obj);
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
      shopStatus: obj['shopStatus']?.toString() ?? '0',
      idCard: obj['idcard'] ?? '',
      certificate: obj['certificate'] ?? '',
      long: obj['longitude'] ?? 0,
      alti: obj['altitude'] ?? 0,
      description: obj['description'] ?? '',
      registTime: obj['regist_time'] ?? '',
      lastModify: obj['last_modify'] ?? '',
      lastLogin: obj['last_login'] ?? '',
      submitTime: obj['submitTime'] ?? '',
      admitTime: obj['admitTime'] ?? '',
    );
  }

  Barber copyWidth({
    String name,
    num status,
    String idCard,
    String certificate,
    String shopStatus,
    String id,
    String nickName,
    String phone,
    String password,
    String avatar,
    num level,
    num sex,
    num score,
    num orderCount,
    num money,
    String address,
    String shop,
    num long, //经度
    num alti, //纬度
    String description,
    String registTime,
    String lastLogin,
    String submitTime, //申请加入店铺的时间
    String admitTime, //申请通过的时间
    String lastModify,
  }) {
    return Barber(
      name: name ?? this.name,
      status: status ?? this.status,
      idCard: idCard ?? this.idCard,
      certificate: certificate ?? this.certificate,
      shopStatus: shopStatus ?? this.shopStatus,
      id: id ?? this.id,
      nickName: nickName ?? this.nickName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      sex: sex ?? this.sex,
      score: score ?? this.score,
      orderCount: orderCount ?? this.orderCount,
      money: money ?? this.money,
      address: address ?? this.address,
      shop: shop ?? this.shop,
      long: long ?? this.long,
      alti: alti ?? this.alti,
      description: description ?? this.description,
      registTime: registTime ?? this.registTime,
      lastLogin: lastLogin ?? this.lastLogin,
      submitTime: submitTime ?? this.submitTime,
      admitTime: admitTime ?? this.admitTime,
      lastModify: lastModify ?? this.lastModify,
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
