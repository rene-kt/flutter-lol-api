import 'package:FlutterGifGallery/control/return-user-api.dart';
import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/widgets/profile-page.widget.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  TextEditingController textController = TextEditingController();
  bool isLoading = false;
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : new Column(
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
                        user =
                            ReturnUser.returnUserFromApi(textController.text);
                        setState(() {
                          isLoading = true;
                          if (user.champs.isNotEmpty) {
                            user.champs.removeRange(0, user.champs.length);
                          }
                        });
                        _sendDataToScreen(context);
                      },
                      child: Text("Submit")),
                ],
              ));
  }

  void _sendDataToScreen(BuildContext context) async {
    setState(() {
      isLoading = false;
    });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilePage(
              text: textController.text,
              user: user,
            )));
  }
}
