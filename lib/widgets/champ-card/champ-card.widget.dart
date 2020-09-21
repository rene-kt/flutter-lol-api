import 'package:FlutterGifGallery/widgets/champ-card/champ-content.widget.dart';
import 'package:flutter/material.dart';

class ChampCard extends StatelessWidget {
  final String champName;
  final int championPoints;
  final int championLevel;
  final int index;

  ChampCard(
      {Key key,
      @required this.champName,
      @required this.championPoints,
      @required this.championLevel,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Color(0xff303030),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black,
            blurRadius: 15.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: CardContent(
        championLevel: championLevel,
        championPoints: championPoints,
        champName: champName,
        index: index,
      ),
    );
  }
}
