import 'package:flutter/material.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';

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
                        print(textController.text);
                        requisition.returnSummonerId(textController.text);
                      },
                      child: Text("Submit"))
                ],
              ))),
    );
  }
}
