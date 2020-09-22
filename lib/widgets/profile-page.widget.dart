import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/service/get-rank-emblem.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';
import 'package:FlutterGifGallery/widgets-from-profile-page/return-level.widget.dart';
import 'package:FlutterGifGallery/widgets-from-profile-page/return-rank.widget.dart';
import 'package:FlutterGifGallery/widgets-from-profile-page/return-winrate-widget.dart';
import 'package:FlutterGifGallery/widgets/champ-card/champ-row.widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final String text;
  final Requisition req = Requisition();
  ProfilePage({Key key, @required this.text, this.user}) : super(key: key);

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
                    GetRankImage.returnImage(user.tier),
                  ),
                  Column(
                    children: <Widget>[
                      Text("RANKED SOLO"),
                      Text(user.tier + " " + user.rank),
                      Text(user.rankedPoints.toString() + " LP"),
                      Text(user.wins.toString() +
                          "W" +
                          " " +
                          user.losses.toString() +
                          "L" +
                          " => " +
                          user.calcWinrate().toStringAsFixed(0) +
                          "%")
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
