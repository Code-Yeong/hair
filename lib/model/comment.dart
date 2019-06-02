class Comment {
  final String content;
  final String commentTime;
  final String cusId;
  final String cusName;
  final num rId;
  final String cusAvatar;
  final num cusSex;
  final int starCount;
  final String shopAvatar;
  final String shopName;
  final String serveName;

  Comment({
    this.content,
    this.commentTime,
    this.cusId,
    this.cusAvatar,
    this.cusSex,
    this.starCount,
    this.shopAvatar,
    this.shopName,
    this.serveName,
    this.cusName,
    this.rId,
  });

  static List<Comment> fromObjList(obj) {
    List<Comment> list = [];
    try {
      for (var item in obj) {
        list.add(Comment(
          content: item['comment'],
          commentTime: item['commentTime'],
          cusId: item['cusId'],
          cusAvatar: item['cusAvatr'],
          cusSex: item['cusSex'],
          starCount: item['starCount'],
          shopAvatar: item['shopAvatar'],
          shopName: item['shopName'],
          serveName: item['serveName'],
          rId: item['rId'],
          cusName: item['cusName'],
        ));
      }
    } catch (e) {
      print('解析理发师评论数据失败:$e');
    }
    return list;
  }

  @override
  String toString() {
    return 'Comment{content: $content, commentTime: $commentTime, cusId: $cusId, cusName: $cusName, rId: $rId, cusAvatar: $cusAvatar, cusSex: $cusSex, starCount: $starCount, shopAvatar: $shopAvatar, shopName: $shopName, serveName: $serveName}';
  }
}
