class MenuViewItem {
  final String imgUrl;
  final String title;
  final String subtitle;
  final String tag;

  final directory; // left menu directory:[剪发、染烫、化妆]
  final subdirectory; // right top menu directory:[全部、男、女、儿童]

  static final titles = ['高圆圆', '清爽菇', '可爱邻家', '恋秋'];
  static final subtitles = ['BUSINESS', 'HOLIDAY', 'FASHION', 'ELSE'];
  static final tags = ['职场必备', '旅行度假', '时尚达人', 'ELSE'];

  MenuViewItem({
    this.imgUrl,
    this.title,
    this.subtitle,
    this.tag,
    this.directory,
    this.subdirectory,
  });

  static List<MenuViewItem> getList() {
    List<MenuViewItem> list = [];
    for (int i = 1; i <= 16; i++) {
      list.add(MenuViewItem(
        imgUrl: 'assets/menu/f${formantNum(i)}.jpg',
        title: titles[(i - 1) % 4],
//        title: titles[i-1],
        subtitle: subtitles[(i - 1) % 4],
        tag: tags[(i - 1) % 4],
      ));
    }
    return list;
  }

  static String formantNum(num n) {
    if (n < 10) {
      return '0$n';
    } else if (n >= 10) {
      return '$n';
    }
  }
}
