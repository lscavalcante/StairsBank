import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';
import 'package:stairsbank/core/shared/constants/font_family_constants.dart';

class TextCustom {
  final BuildContext context;

  TextCustom(this.context);

  TextStyle get title {
    return TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamilyConstants.titilliumWeb,
    );
  }

  TextStyle get p {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle get info {
    return TextStyle(
      fontSize: 11,
      color: Color(0xFF727E96),
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle get span {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle get normal {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle get button {
    return TextStyle(
      color: ThemeColors.white,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }
}
