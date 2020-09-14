import 'package:flutter/material.dart';

class ReturnLevel extends StatelessWidget {
  final int level;
  ReturnLevel({Key key, @required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            "LEVEL",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            level.toString(),
            //SUMMONER LEVEL VINDO DA API
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
