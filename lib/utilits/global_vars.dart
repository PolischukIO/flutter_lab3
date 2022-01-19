class GlobalVars {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static bool is_hero = false;

  double set_w(int w) => screenWidth * w / 100;
  double set_h(int h) => screenHeight * h / 100;
}
