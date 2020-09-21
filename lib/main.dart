import 'package:FlutterGifGallery/widgets/form-widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.white,
      cursorColor: Colors.white,
      focusColor: Colors.white,
      textSelectionColor: Colors.deepPurple[100],
      indicatorColor: Colors.white,
      hoverColor: Colors.white,
      textSelectionHandleColor: Colors.white,
      // default value
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
