import 'package:FlutterGifGallery/widgets/profile-page.widget.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              _sendDataToScreen(context);
            },
            child: Text("Submit")),
      ],
    ));
  }

  void _sendDataToScreen(BuildContext context) {
    String textToSend = textController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            text: textToSend,
          ),
        ));
  }
}
