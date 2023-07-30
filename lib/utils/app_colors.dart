import 'package:flutter/material.dart';

/// Helper class to define all colors used in the application
///
///
/// Crisp White: #FFFFFF
// This pure white color represents cleanliness, simplicity, and purity. It creates a sense of freshness and allows other colors to stand out.

// Ivory: #F8F8F8
// Ivory is a warm off-white color that adds a subtle touch of elegance and sophistication. It creates a softer contrast against the pure white background.

// Pearl: #E8E8E8
// Pearl is a light grayish-white color that adds a hint of warmth and depth. It can be used as a background color for sections or to highlight specific elements.

// Mist: #D8D8D8
// Mist is a cool grayish-white shade that adds a touch of tranquility and a modern aesthetic. It can be used as an accent color or for subtle dividers and borders.

// Cloud: #F5F5F5
// Cloud is a soft, slightly warmer shade of white that adds a gentle and dreamy atmosphere. It can be used for backgrounds or to create a sense of depth.
class AppColors {
  AppColors._();

  static const blackColor = Color(0xff000000);
  static const whiteColor = Color(0xffffffff);
  static const ivory = Color(0xffF8F8F8);
  static const nonSelectedOrderScreenAppVarNumberBackground = Color(0xffEFF2F2);
  static const blue = Color(0xff0000ff);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
