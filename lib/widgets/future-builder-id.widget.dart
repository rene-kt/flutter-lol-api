import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';
import 'package:flutter/material.dart';

class FutureBuilderID extends StatefulWidget {
  @override
  _FutureBuilderIDState createState() => _FutureBuilderIDState();
}

Widget returnFutureBuilderId() {
  Requisition req = Requisition();
  User user = User();

  return FutureBuilder<Map>(
    future: req.returnSummonerId(),
    builder: (context, snapshot) {
      user.id = snapshot.data["id"];
      user.summonerLevel = snapshot.data["summonerLevel"];
      user.profileIconId = snapshot.data["profileIconId"];

      return Column(children: <Widget>[
        Text(id),
        Text(user.summonerLevel.toString()),
        Text(user.profileIconId.toString()),
      ]);
    },
  );
}

class _FutureBuilderIDState extends State<FutureBuilderID> {
  @override
  Widget build(BuildContext context) {
    return returnFutureBuilderId();
  }
}
