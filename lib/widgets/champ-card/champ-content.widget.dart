import 'package:FlutterGifGallery/service/getMasteriesImageByChampionLevel.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String champName;
  final int championPoints;
  final int championLevel;
  final int index;

  CardContent(
      {Key key,
      @required this.champName,
      @required this.championPoints,
      @required this.championLevel,
      @required this.index})
      : super(key: key);

  final nameTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600);

  final championPointsStyle = TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 10.0,
      fontWeight: FontWeight.w300);

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
            index.toString() + ' - ' + champName,
            style: nameTextStyle,
          ),
          new Container(height: 10.0),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Colors.deepPurple),
          new Row(
            children: <Widget>[
              new Image.asset(GetMasteriesImage.byChampionLevel(championLevel),
                  height: 12.0),
              new Text(
                ' CHAMPION POINTS: ',
                style: championPointsStyle,
              ),
              new Container(width: 8.0),
              new Text(
                championPoints.toString(),
                style: championPointsStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
