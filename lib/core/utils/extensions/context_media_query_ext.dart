import 'package:flutter/widgets.dart';

extension ContextMediaQueryExt on BuildContext {
  /// MediaQueryData shortcuts
  MediaQueryData get mq => MediaQuery.of(this);

  /// Screen size
  Size get size => mq.size;
  double get w => mq.size.width;
  double get h => mq.size.height;

  /// Safe area paddings
  EdgeInsets get padding => mq.padding;
  EdgeInsets get viewPadding => mq.viewPadding;
  EdgeInsets get viewInsets => mq.viewInsets;

  /// Common helpers
  bool get isSmallPhone => w < 360;
}
