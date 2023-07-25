import 'package:flutter/cupertino.dart';
import 'package:stairsbank/core/presentation/theme/theme_constants.dart';

class SpacerVertical extends SizedBox {
  const SpacerVertical.half({Key? key})
      : super(height: ThemeConstants.halfPadding, key: key);
  const SpacerVertical.normal({Key? key})
      : super(height: ThemeConstants.padding, key: key);
  const SpacerVertical.double({Key? key})
      : super(height: ThemeConstants.bigPadding, key: key);
}

class SpacerHorizontal extends SizedBox {
  const SpacerHorizontal.half({Key? key})
      : super(width: ThemeConstants.halfPadding, key: key);
  const SpacerHorizontal.normal({Key? key})
      : super(width: ThemeConstants.padding, key: key);
  const SpacerHorizontal.double({Key? key})
      : super(width: ThemeConstants.bigPadding, key: key);
}
