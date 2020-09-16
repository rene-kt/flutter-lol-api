class Champion {
  int championId;
  String championName;
  int championsPoints;
  int championLevel;

  Champion(int championId, String championName, int championPoints,
      intChampionLevel) {
    this.championId = championId;
    this.championName = championName;
    this.championsPoints = championPoints;
    this.championLevel = championLevel;
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
