import 'package:FlutterGifGallery/models/user.model.dart';
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
        body: Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple[200], Colors.deepPurple[300]])),
          child: Container(
            height: 350.0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      req.returnUrlImage(user.profileIconId),
                      //PROFILE ICON DA API
                    ),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    text,
                    //NOME DO INVOCADOR
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 22.0),
                      child: Row(
                        children: <Widget>[
                          ReturnLevel(
                            level: user.summonerLevel,
                          ),
                          ReturnRank(
                            ranked: user.rank,
                            tier: user.tier,
                          ),
                          ReturnWinrate(
                            winrate: user.winrate,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
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
