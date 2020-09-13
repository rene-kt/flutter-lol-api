import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Widget returnAppBar() {
    return Scaffold(
      appBar: AppBar(
        title: Text("SUMMONER NAME Q EU PEGO DO CONTROLLER TEXT"),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget returnCircleProfileIcon() {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Color(0xffFDCF09),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('images/batman.jpg'),
        //pegar imagem da API
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
