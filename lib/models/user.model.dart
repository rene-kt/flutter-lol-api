import 'champion.model.dart';

class User {
  String id;
  int profileIconId;
  int summonerLevel;
  List<Champion> champs = List();
  String rank;
  String tier;
  int rankedPoints;
  int wins;
  int losses;

  double calcWinrate() {
    return (wins / (wins + losses) * 100);
  }

  @override
  String toString() {
    String returnId = "ID: " + id;
    String returnLevel = "Level: " + summonerLevel.toString();
    String returnRank = "Rank: " + rank;
    String returnTier = "Tier: " + tier;

    return returnId + returnLevel + champs.toString() + returnTier + returnRank;
  }
}
