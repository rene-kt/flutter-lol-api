import 'package:FlutterGifGallery/widgets/champ-card/champ-content.widget.dart';
import 'package:flutter/material.dart';

class ChampCard extends StatelessWidget {
  final String champName;
  final int championPoints;
  final int championLevel;

  ChampCard(
      {Key key,
      @required this.champName,
      @required this.championPoints,
      @required this.championLevel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: CardContent(
        championLevel: championLevel,
        championPoints: championPoints,
        champName: champName,
      ),
    );
  }
}
