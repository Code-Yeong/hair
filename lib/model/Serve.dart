class Serve {
  final String id;
  final String name;
  final String type;
  final num money;

  Serve({this.id, this.name, this.type, this.money});

  static List<Serve> fromObjList(obj) {
    List<Serve> list = [];
    if (obj == null) {
      return list;
    }
    for (var item in obj) {
      list.add(Serve(
        id: item['id'].toString(),
        name: item['name'],
        type: item['type'].toString(),
        money: num.parse(item['money'] ?? 0),
      ));
    }
    return list;
  }
}
