class UserRank {
  String rank;
  String tier;
  int leaguePoints;
  int wins;
  int losses;

  UserRank(String rank, String tier, int leaguePoints, int wins, int losses) {
    this.rank = rank;
    this.tier = tier;
    this.leaguePoints = leaguePoints;
    this.wins = wins;
    this.losses = losses;
  }

  double calcWinrate() {
    return (wins / (wins + losses) * 100);
  }
}
