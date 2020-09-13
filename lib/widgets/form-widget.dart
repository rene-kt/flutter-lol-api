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
        RaisedButton(onPressed: () {}, child: Text("Submit")),
      ],
    ));
  }
}
