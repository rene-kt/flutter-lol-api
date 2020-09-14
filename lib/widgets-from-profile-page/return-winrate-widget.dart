import 'package:flutter/material.dart';

class ReturnWinrate extends StatelessWidget {
  final String winrate;
  ReturnWinrate({Key key, @required this.winrate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            "W/R",
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
            winrate,
            //WR, WINS/LOSE
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
