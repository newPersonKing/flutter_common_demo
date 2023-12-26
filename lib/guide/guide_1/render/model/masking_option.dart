import 'package:flutter/material.dart';

import '../../guide_item.dart';

class MaskingOption {
  String overlayDesc;

  Rect drawRect;

  DescriptionPosition position;

  TextStyle overlayStyle;

  EdgeInsets rectPadding;

  BorderRadius borderRadius;

  double descInterval;

  MaskingOption(
    this.overlayDesc,
    this.drawRect,
    this.position,
    this.overlayStyle,
    this.rectPadding,
    this.borderRadius,
    this.descInterval,
  );
}
