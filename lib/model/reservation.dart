class Reservation {
  final String rId;
  final String avatar;

  final String createTime;
  final String serveTime;
  final String finshedTime;
  final String commentTime;

  final String cusId;
  final String barberId;
  final String shopId;
  final String adddress;
  final String cusName;
  final String staffName;
  final String serveName;
  final String code;
  final String verified;

  final String status;
  final String serviceType;
  final String money;
  final String comment;

  Reservation(
      {this.rId,
      this.avatar,
      this.createTime,
      this.serveTime,
      this.finshedTime,
      this.commentTime,
      this.cusId,
      this.barberId,
      this.shopId,
      this.code,
      this.verified,
      this.adddress,
      this.cusName,
      this.staffName,
      this.serveName,
      this.status,
      this.serviceType,
      this.money,
      this.comment});

  Reservation copyWith({
    String rId,
    String avatar,
    String createTime,
    String serveTime,
    String finshedTime,
    String commentTime,
    String cusId,
    String barberId,
    String shopId,
    String address,
    String cusName,
    String staffName,
    String serveName,
    String status,
    String serviceType,
    String code,
    String verified,
    String money,
    String comment,
  }) {
    return Reservation(
      rId: rId ?? this.rId,
      avatar: avatar ?? this.avatar,
      createTime: createTime ?? this.createTime,
      serveTime: serveTime ?? this.serveTime,
      finshedTime: finshedTime ?? this.finshedTime,
      commentTime: commentTime ?? this.commentTime,
      cusId: cusId ?? this.cusId,
      barberId: barberId ?? this.barberId,
      shopId: shopId ?? this.shopId,
      adddress: address ?? this.adddress,
      cusName: cusName ?? this.cusName,
      staffName: staffName ?? this.staffName,
      serveName: serveName ?? this.serveName,
      status: status ?? this.status,
      code: code ?? this.code,
      verified: verified ?? this.verified,
      serviceType: serviceType ?? this.serviceType,
      money: money ?? this.money,
      comment: comment ?? this.comment,
    );
  }

  static List<Reservation> fromObjList(obj) {
    List<Reservation> reservationList = [];

    for (var item in obj) {
      print("这里 ${item['verified']}");
      reservationList.add(Reservation(
        rId: item['id'].toString() ?? '',
        avatar: item['avatar'] ?? 'assets/images/barber.jpg',
        createTime: item['createTime'] ?? '',
        serveTime: item['serveTime'] ?? '',
        finshedTime: item['finshedTime'] ?? '',
        commentTime: item['commentTime'] ?? '',
        cusId: item['cusId'] ?? '',
        code: item['code'] ?? '',
        verified: item['verified'] ?? '',
        barberId: item['barberId'] ?? '',
        shopId: item['shopId'] ?? '',
        adddress: item['address'] ?? '', // ???
        cusName: item['cusName'] ?? '',
        staffName: item['staffName'] ?? '',
        serveName: item['serveName'] ?? '',
        status: item['status'].toString() ?? '',
        serviceType: item['serviceType'] ?? '', // ????
        money: item['money'].toString() ?? '',
        comment: item['comment'] ?? '',
      ));
    }
    return reservationList;
  }

  @override
  String toString() {
    return 'Reservation{rId: $rId,code: $code,verified:$verified, avatar: $avatar, createTime: $createTime, serveTime: $serveTime, finshedTime: $finshedTime, commentTime: $commentTime, cusId: $cusId, barberId: $barberId, shopId: $shopId, adddressId: $adddress, cusName: $cusName, staffName: $staffName, serveName: $serveName, status: $status, serviceType: $serviceType, money: $money, comment: $comment}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reservation &&
          runtimeType == other.runtimeType &&
          rId == other.rId &&
          code == other.code &&
          verified == other.verified &&
          avatar == other.avatar &&
          createTime == other.createTime &&
          serveTime == other.serveTime &&
          finshedTime == other.finshedTime &&
          commentTime == other.commentTime &&
          cusId == other.cusId &&
          barberId == other.barberId &&
          shopId == other.shopId &&
          adddress == other.adddress &&
          cusName == other.cusName &&
          staffName == other.staffName &&
          serveName == other.serveName &&
          status == other.status &&
          serviceType == other.serviceType &&
          money == other.money &&
          comment == other.comment;

  @override
  int get hashCode =>
      rId.hashCode ^
      avatar.hashCode ^
      code.hashCode ^
      verified.hashCode ^
      createTime.hashCode ^
      serveTime.hashCode ^
      finshedTime.hashCode ^
      commentTime.hashCode ^
      cusId.hashCode ^
      barberId.hashCode ^
      shopId.hashCode ^
      adddress.hashCode ^
      cusName.hashCode ^
      staffName.hashCode ^
      serveName.hashCode ^
      status.hashCode ^
      serviceType.hashCode ^
      money.hashCode ^
      comment.hashCode;
}
