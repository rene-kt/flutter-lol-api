import 'package:flutter/material.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';

import 'models/champion.model.dart';
import 'models/user.model.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Requisition requisition = Requisition();

  TextEditingController textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  User user = User();
  Champion champ = Champion();

  Widget returnFutureBuilderId() {
    return FutureBuilder<Map>(
      future: requisition.returnSummonerId(textController.text),
      builder: (context, snapshot) {
        user.id = snapshot.data["id"];
        user.summonerLevel = snapshot.data["summonerLevel"];
        user.profileIconId = snapshot.data["profileIconId"];

        return Column(children: <Widget>[
          Text(textController.text),
          Text(user.summonerLevel.toString()),
          Text(user.profileIconId.toString()),
        ]);
      },
    );
  }

  Widget returnFutureBuilderChamps() {
    return FutureBuilder<List>(
        future: requisition.returnChampions(user.id),
        builder: (context, snapshot) {
          user.championsId1 = snapshot.data[0]["championId"];
          user.championsId2 = snapshot.data[1]["championId"];
          user.championsId3 = snapshot.data[2]["championId"];

          champ.champ

          return Column(children: <Widget>[
            Text(user.championsId1.toString()),
            Text(user.championsId2.toString()),
            Text(user.championsId3.toString())
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riot games api"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
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
                      requisition.returnSummonerId(textController.text);

                      setState(() {
                        returnFutureBuilderId();
                        returnFutureBuilderChamps();
                      });
                    },
                    child: Text("Submit")),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: returnFutureBuilderId(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: returnFutureBuilderChamps(),
                )
              ],
            )),
      ),
    );
  }
}
