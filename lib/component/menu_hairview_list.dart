import 'package:flutter/material.dart';

typedef ItemSelected(num value);

class MenuHairViewList extends StatelessWidget {
  final ItemSelected onTap;
  final String title;
  final String subtitle;
  final String tag;
  final num index;
  final String imgUrl;

  MenuHairViewList({
    this.onTap,
    this.title,
    this.subtitle,
    this.tag,
    this.index,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(imgUrl),
                  ),
                  Container(
                    width: 64.0,
                    padding: EdgeInsets.all(2),
                    alignment: Alignment.center,
                    color: Colors.orangeAccent.withOpacity(0.8),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      "$subtitle",
                      style: TextStyle(
                        color: Colors.black12,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
