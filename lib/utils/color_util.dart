import 'dart:ui';

class ColorUtil {
  static Color transformColorHexToInt(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");

    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  static Color getHeaderColor() {
    return transformColorHexToInt("#457fca");
  }

  static Color getHoverColor() {
    return transformColorHexToInt("#FF9F8A");
  }
}