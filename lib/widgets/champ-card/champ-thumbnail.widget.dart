import 'package:FlutterGifGallery/service/requisitions.service.dart';
import 'package:flutter/material.dart';

class ChampThumb extends StatelessWidget {
  final Requisition req = Requisition();
  final String champName;

  ChampThumb({Key key, @required this.champName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.centerLeft,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          req.returnUrlChampImage(champName),

          //PROFILE ICON DA API
        ),
        radius: 50.0,
      ),
    );
  }
}
