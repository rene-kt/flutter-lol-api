import 'package:FlutterGifGallery/widgets/champ-card/champ-card.widget.dart';
import 'package:FlutterGifGallery/widgets/champ-card/champ-thumbnail.widget.dart';
import 'package:flutter/material.dart';

class ChampRow extends StatelessWidget {
  final String champName;
  final int championPoints;
  final int championLevel;

  ChampRow(
      {Key key,
      @required this.champName,
      @required this.championPoints,
      @required this.championLevel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          ChampCard(
            championLevel: championLevel,
            championPoints: championPoints,
            champName: champName,
          ),
          ChampThumb(champName: champName)
        ],
      ),
    );
  }
}
