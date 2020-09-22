class GetMasteriesImage {
  static String byChampionLevel(level) {
    switch (level) {
      case 1:
        return "lib/assets/masteries/1.png";
        break;
      case 2:
        return "lib/assets/masteries/2.png";
        break;
      case 3:
        return "lib/assets/masteries/3.png";
        break;
      case 4:
        return "lib/assets/masteries/4.png";
        break;
      case 5:
        return "lib/assets/masteries/5.png";
        break;
      case 6:
        return "lib/assets/masteries/6.png";
        break;
      case 7:
        return "lib/assets/masteries/7.png";
        break;
      default:
        return "";
    }
  }
}
