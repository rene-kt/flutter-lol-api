import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/service/get-rank-emblem.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';
import 'package:FlutterGifGallery/widgets/champ-card/champ-row.widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final String text;
  final Requisition req = Requisition();
  ProfilePage({Key key, @required this.text, this.user}) : super(key: key);

  final titleTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 22.0,
  );

  final tierTextStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0);
  //retornar a cor do tier

  final pointsStyle = TextStyle(color: Colors.white, fontSize: 15.0);

  final winsLossesStyle =
      TextStyle(color: Colors.blueGrey[100], fontSize: 13.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("profile page"),
          backgroundColor: Colors.black,
        ),
        body: Column(children: <Widget>[
          Container(
            height: 180.0,
            width: 300.0,
            child: Card(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.only(top: 10.0),
                children: <Widget>[
                  Image.asset(
                    GetRankImage.returnImage(user.ranks.elementAt(0).tier),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text("RANKED SOLO", style: titleTextStyle),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              user.ranks.elementAt(0).tier +
                                  " " +
                                  user.ranks.elementAt(0).rank,
                              style: tierTextStyle,
                            ),
                            Text(
                                user.ranks
                                        .elementAt(0)
                                        .leaguePoints
                                        .toString() +
                                    " LP",
                                style: pointsStyle),
                            Text(
                                user.ranks.elementAt(0).wins.toString() +
                                    "W" +
                                    " " +
                                    user.ranks.elementAt(0).losses.toString() +
                                    "L",
                                style: winsLossesStyle),
                            Text(
                                user.ranks
                                        .elementAt(0)
                                        .calcWinrate()
                                        .toStringAsFixed(0) +
                                    "%",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      user.ranks.elementAt(0).calcWinrate() >=
                                              50.0
                                          ? Colors.lightBlue[200]
                                          : Colors.red[200],
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: new ListView.builder(
              itemBuilder: (context, index) => new ChampRow(
                  champName: user.champs.elementAt(index).championName,
                  championPoints: user.champs.elementAt(index).championsPoints,
                  championLevel: user.champs.elementAt(index).championLevel,
                  index: index + 1),
              itemCount: user.champs.length,
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
          )
        ]));
  }
}
