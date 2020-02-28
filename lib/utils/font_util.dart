class FontUtil {
  static double fontSize(double fontSize, {min: 2, max: 12}) {
    if (fontSize < min) {
      return min;
    } else if (fontSize > max) {
      return max;
    } else {
      return fontSize;
    }
  }
}