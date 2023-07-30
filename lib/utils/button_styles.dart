import 'package:flutter/material.dart';
import 'package:nutrivine/utils/app_colors.dart';

class ButtonStyes {
  static ButtonStyle desktopButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    )),
  );
}
