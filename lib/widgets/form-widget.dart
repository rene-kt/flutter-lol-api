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
  User user = User();
  Requisition req = Requisition();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
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
            onPressed: () {
              _sendDataToScreen(context);
            },
            child: Text("Submit")),
      ],
    ));
  }

  User returnUserFromApi(String summonerName) {
    req.returnSummonerId(summonerName).then((data) {
      user.id = data['id'];
      user.summonerLevel = data['summonerLevel'];
    }, onError: (e) {
      print(e);
    });
    req.returnChampions(user.id).then((data) {
      for (int i = 0; i >= 2; i++) {
        Champion champ = Champion();
        champ.championId = data[i]["championId"];
        champ.championName = GetChampions.getChampionNameById(champ.championId);
        champ.championsPoints = data[i]["championPoints"];
        user.champs.add(champ);
      }
    });
    req.returnRank(user.id).then((data) {
      user.tier = data[0]['tier'];
      user.rank = data[0]['rank'];
      user.rankedPoints = data[0]['rankedPoints'];
      user.winrate = (data[0]['wins'] / data[0]['losses']).toString() + "%";
    });
    return user;
  }

  void _sendDataToScreen(BuildContext context) {
    String textToSend = textController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            text: textToSend,
          ),
        ));
  }
}
