import 'package:FlutterGifGallery/widgets/form-widget.dart';
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
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riot games api"),
      ),
      body: FormFieldWidget(),
    );
  }
}
