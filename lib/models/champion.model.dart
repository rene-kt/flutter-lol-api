class Champion {
  int championId;
  String championName;
  int championsPoints;

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
