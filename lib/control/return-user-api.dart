import 'package:FlutterGifGallery/models/champion.model.dart';
import 'package:FlutterGifGallery/models/user.model.dart';
import 'package:FlutterGifGallery/service/getChampions.service.dart';
import 'package:FlutterGifGallery/service/requisitions.service.dart';

class ReturnUser {
  static User returnUserFromApi(String summonerName) {
    User user = User();
    Requisition req = Requisition();

    req.returnSummonerId(summonerName).then((data) {
      user.id = data["id"];
      user.summonerLevel = data["summonerLevel"];
      user.profileIconId = data["profileIconId"];
    });
    req.returnChampions(user.id).then((data) {
      List<Champion> champ = [];

      champ.add(new Champion(
          data[0]["championId"],
          GetChampions.getChampionNameById(data[0]["championId"]),
          data[0]["championPoints"],
          data[0]["championLevel"]));

      champ.add(new Champion(
          data[1]["championId"],
          GetChampions.getChampionNameById(data[1]["championId"]),
          data[1]["championPoints"],
          data[1]["championLevel"]));

      champ.add(new Champion(
          data[2]["championId"],
          GetChampions.getChampionNameById(data[2]["championId"]),
          data[2]["championPoints"],
          data[2]["championLevel"]));

      user.champs.addAll(champ);
    });
    req.returnRank(user.id).then((data) {
      user.tier = data[0]['tier'];
      user.rank = data[0]['rank'];
      user.rankedPoints = data[0]['rankedPoints'];
      user.winrate = user.calcWinrate(data[0]['wins'], data[0]['losses']);
    });
    return user;
  }
}
