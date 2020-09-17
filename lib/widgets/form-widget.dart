import 'package:FlutterGifGallery/models/champion.model.dart';
import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/service/getChampions.service.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';
import 'package:FlutterGifGallery/widgets/profile-page.widget.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  TextEditingController textController = TextEditingController();
  Requisition req = Requisition();
  User user = User();
  bool isLoading = false;

  @override
  void initState() {

    setstat
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : new Column(
                children: <Widget>[
                  TextFormField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'Type the summoner name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please, enter some text";
                        } else {
                          return null;
                        }
                      }),
                  RaisedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        _sendDataToScreen(context);
                      },
                      child: Text("Submit")),
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
      user.tier = data[0]['tier'];
      user.rank = data[0]['rank'];
      user.rankedPoints = data[0]['rankedPoints'];
      user.winrate = user.calcWinrate(data[0]['wins'], data[0]['losses']);
    });
  }

  void _sendDataToScreen(BuildContext context) async {
    await returnUserFromApi(textController.text);
    String textToSend = textController.text;

    setState(() {
      isLoading = false;
    });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilePage(
              text: textToSend,
              user: user,
            )));
  }
}
