import 'package:flutter/material.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';

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

  Widget returnFutureBuilder() {
    return FutureBuilder<Map>(
      future: requisition.returnSummonerId(textController.text),
      builder: (context, snapshot) {
        user.id = snapshot.data["id"];
        user.summonerLevel = snapshot.data["summonerLevel"];
        user.profileIconId = snapshot.data["profileIconId"];

        print("PROFILE ICON " + user.profileIconId.toString());

        return Column(children: <Widget>[
          Text(textController.text),
          Text(user.summonerLevel.toString()),
          Text(user.profileIconId.toString()),
        ]);
      },
    );
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
                        returnFutureBuilder();
                      });
                    },
                    child: Text("Submit")),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: returnFutureBuilder(),
                )
              ],
            )),
      ),
    );
  }
}
