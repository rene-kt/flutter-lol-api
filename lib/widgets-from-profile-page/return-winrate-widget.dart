import 'package:flutter/material.dart';

class ReturnWinrate extends StatelessWidget {
  final int win;
  final int lose;
  ReturnWinrate({Key key, @required this.win, @required this.lose})
      : super(key: key);

  String _calculateWinrate() {
    return (win / lose).toString() + "%";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            "W/R",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            _calculateWinrate(),
            //WR, WINS/LOSE
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.pinkAccent,
            ),
          )
        ],
      ),
    );
  }
}
