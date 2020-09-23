import 'package:FlutterGifGallery/models/user-rank.model.dart';

import 'champion.model.dart';

class User {
  String id;
  int profileIconId;
  int summonerLevel;
  List<Champion> champs = List();
  List<UserRank> ranks = List();
}
