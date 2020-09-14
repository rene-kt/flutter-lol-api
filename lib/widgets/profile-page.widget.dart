import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/widgets-from-profile-page/return-level.widget.dart';
import 'package:FlutterGifGallery/widgets-from-profile-page/return-rank.widget.dart';
import 'package:FlutterGifGallery/widgets-from-profile-page/return-winrate-widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final String text;
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
                  colors: [Colors.redAccent, Colors.pinkAccent])),
          child: Container(
            width: double.infinity,
            height: 350.0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
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
          ))
    ]));
  }
}
