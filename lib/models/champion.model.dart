class Champion {
  int championId;
  String championName;
  int championsPoints;

  Champion(int championId, String championName, int championPoints) {
    this.championId = championId;
    this.championName = championName;
    this.championsPoints = championPoints;
  }

  @override
  String toString() {
    return "ID: " +
        championId.toString() +
        "|" +
        "Name: " +
        championName +
        "|" +
        "Points: " +
        championsPoints.toString();
  }
}
