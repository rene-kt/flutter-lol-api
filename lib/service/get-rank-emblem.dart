class GetRankImage {
  static returnImage(String tierParam) {
    String tier = tierParam.toLowerCase();
    return "lib/assets/ranks/$tier.png";
  }
}
