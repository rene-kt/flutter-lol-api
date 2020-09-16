class GetMasteriesImage {
  static String byChampionLevel(int level) {
    switch (level) {
      case 1:
        return "lib/images/masteries/1.png";
        break;
      case 2:
        return "lib/images/masteries/2.png";
        break;
      case 3:
        return "lib/images/masteries/3.png";
        break;
      case 4:
        return "lib/images/masteries/4.png";
        break;
      case 5:
        return "lib/images/masteries/5.png";
        break;
      case 6:
        return "lib/images/masteries/6.png";
        break;
      case 7:
        return "lib/images/masteries/7.png";
        break;
      default:
        return "lib/assets/masteries/7.png";
    }
  }
}
