import 'champion.model.dart';

class User {
  String id;
  int profileIconId;
  int summonerLevel;
  List<Champion> champs = List();

  @override
  String toString() {
    String returnId = "ID: " + id;
    String returnLevel = "Level: " + summonerLevel.toString();

    return returnId + returnLevel + champs.toString();
  }
}
