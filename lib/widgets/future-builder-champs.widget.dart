import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';
import 'package:flutter/material.dart';

class FutureBuilderChamps extends StatefulWidget {
  @override
  _FutureBuilderChampsState createState() => _FutureBuilderChampsState();
}

class _FutureBuilderChampsState extends State<FutureBuilderChamps> {
  Requisition requisition = Requisition();
  User user = User();

  Widget returnFutureBuilderId() {
    return FutureBuilder<Map>(
      // future: requisition.returnSummonerId(),
      builder: (context, snapshot) {
        user.id = snapshot.data["id"];
        user.summonerLevel = snapshot.data["summonerLevel"];
        user.profileIconId = snapshot.data["profileIconId"];

        return Column(children: <Widget>[
          Text(user.summonerLevel.toString()),
          Text(user.profileIconId.toString()),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
