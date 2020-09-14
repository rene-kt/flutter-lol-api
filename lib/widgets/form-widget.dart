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
      print("entrou");
    });

    await req.returnChampions(user.id).then((data) {
      print("entrou");

      for (int i = 0; i >= 2; i++) {
        Champion champ = Champion();
        champ.championId = data[i]["championId"];
        champ.championName = GetChampions.getChampionNameById(champ.championId);
        champ.championsPoints = data[i]["championPoints"];
        user.champs.add(champ);
      }
    });
    await req.returnRank(user.id).then((data) {
      print("entrou");

      user.tier = data[0]['tier'];
      user.rank = data[0]['rank'];
      user.rankedPoints = data[0]['rankedPoints'];
      user.winrate = user.calcWinrate(data[0]['wins'], data[0]['losses']);
    });
    print(user.toString());
  }

  void _sendDataToScreen(BuildContext context) async {
    await returnUserFromApi(textController.text);
    String textToSend = textController.text;
    isLoading = false;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            text: textToSend,
            user: user,
          ),
        ));
  }
}
