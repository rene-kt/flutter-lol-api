import 'package:FlutterGifGallery/models/champion.model.dart';
import 'package:FlutterGifGallery/models/user-rank.model.dart';
import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/service/get-champion-by-id.service.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';
import 'package:FlutterGifGallery/widgets/profile-page.widget.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  TextEditingController textController = TextEditingController();
  bool isLoading = false;
  User user = User();
  Requisition req = Requisition();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : new Column(
                children: <Widget>[
                  TextField(
                    controller: textController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      suffixStyle: TextStyle(color: Colors.white),
                      hintText: 'Enter a summoner name',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: Colors.deepPurple,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Container(
                      width: 300.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.deepPurple)),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            if (user.champs.isNotEmpty) {
                              user.champs.removeRange(0, user.champs.length);
                            }
                          });
                          _sendDataToScreen(context);
                        },
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        child: Text("submit".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                ],
              ));
  }

  Future<void> returnUserFromApi(String summonerName) async {
    await req.returnSummonerId(summonerName).then((data) {
      user.id = data["id"];
      user.summonerLevel = data["summonerLevel"];
      user.profileIconId = data["profileIconId"];
    });
    req.returnChampions(user.id).then((data) {
      List<Champion> champ = [];

      champ.add(new Champion(
          data[0]["championId"],
          GetChampions.getChampionNameById(data[0]["championId"]),
          data[0]["championPoints"],
          data[0]["championLevel"]));

      champ.add(new Champion(
          data[1]["championId"],
          GetChampions.getChampionNameById(data[1]["championId"]),
          data[1]["championPoints"],
          data[1]["championLevel"]));

      champ.add(new Champion(
          data[2]["championId"],
          GetChampions.getChampionNameById(data[2]["championId"]),
          data[2]["championPoints"],
          data[2]["championLevel"]));

      user.champs.addAll(champ);
    });
    await req.returnRank(user.id).then((data) {
      List<UserRank> ranks = [];

      ranks.add(new UserRank(
        data[0]['rank'],
        data[0]['tier'],
        data[0]['leaguePoints'],
        data[0]['wins'],
        data[0]['losses'],
      ));

      ranks.add(new UserRank(
        data[1]['rank'],
        data[1]['tier'],
        data[1]['leaguePoints'],
        data[1]['wins'],
        data[1]['losses'],
      ));
      user.ranks.addAll(ranks);
    });
  }

  void _sendDataToScreen(BuildContext context) async {
    await returnUserFromApi(textController.text);

    setState(() {
      isLoading = false;
    });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilePage(
              text: textController.text,
              user: user,
            )));
  }
}
