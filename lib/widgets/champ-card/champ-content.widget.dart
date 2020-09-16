import 'package:FlutterGifGallery/service/getMasteriesImageByChampionLevel.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String champName;
  final int championPoints;
  final int championLevel;
  CardContent(
      {Key key,
      @required this.champName,
      @required this.championPoints,
      @required this.championLevel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            champName,
          ),
          new Container(height: 10.0),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Image.asset("images/masteries/7.png", height: 12.0),
              new Container(width: 8.0),
              new Text(
                championPoints.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
