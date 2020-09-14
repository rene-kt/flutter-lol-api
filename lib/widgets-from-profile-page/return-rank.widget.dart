import 'package:flutter/material.dart';

class ReturnRank extends StatelessWidget {
  final String ranked;
  final String tier;

  ReturnRank({Key key, @required this.ranked, @required this.tier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            "RANK",
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
            tier + " " + ranked,
            //RANKED VINDO DA API: OURO IV, 15 pdl
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
