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
  final String staffName;
  final String reservationName;

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
      this.staffName,
      this.reservationName,
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
    String staffName,
    String reservationName,
    String status,
    String serviceType,
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
      staffName: staffName ?? this.staffName,
      reservationName: reservationName ?? this.reservationName,
      status: status ?? this.status,
      serviceType: serviceType ?? this.serviceType,
      money: money ?? this.money,
      comment: comment ?? this.comment,
    );
  }

  static List<Reservation> fromObjList(obj) {
    List<Reservation> reservationList = [];

    for (var item in obj) {
      reservationList.add(Reservation(
        rId: item['id'].toString() ?? '',
        avatar: item['avatar'] ?? 'assets/images/barber.jpg',
        createTime: item['createTime'] ?? '',
        serveTime: item['serveTime'] ?? '',
        finshedTime: item['finshedTime'] ?? '',
        commentTime: item['commentTime'] ?? '',
        cusId: item['cusId'] ?? '',
        barberId: item['barberId'] ?? '',
        shopId: item['shopId'] ?? '',
        staffName: item['staffName'] ?? '',
        reservationName: item['reservationName'] ?? '',
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
    return 'Reservation{rId: $rId, avatar: $avatar, createTime: $createTime, serveTime: $serveTime, finshedTime: $finshedTime, commentTime: $commentTime, cusId: $cusId, barberId: $barberId, shopId: $shopId, staffName: $staffName, reservationName: $reservationName, status: $status, serviceType: $serviceType, money: $money, comment: $comment}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reservation &&
          runtimeType == other.runtimeType &&
          rId == other.rId &&
          avatar == other.avatar &&
          createTime == other.createTime &&
          serveTime == other.serveTime &&
          finshedTime == other.finshedTime &&
          commentTime == other.commentTime &&
          cusId == other.cusId &&
          barberId == other.barberId &&
          shopId == other.shopId &&
          staffName == other.staffName &&
          reservationName == other.reservationName &&
          status == other.status &&
          serviceType == other.serviceType &&
          money == other.money &&
          comment == other.comment;

  @override
  int get hashCode =>
      rId.hashCode ^
      avatar.hashCode ^
      createTime.hashCode ^
      serveTime.hashCode ^
      finshedTime.hashCode ^
      commentTime.hashCode ^
      cusId.hashCode ^
      barberId.hashCode ^
      shopId.hashCode ^
      staffName.hashCode ^
      reservationName.hashCode ^
      status.hashCode ^
      serviceType.hashCode ^
      money.hashCode ^
      comment.hashCode;
}
