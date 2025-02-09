import 'package:flutter/material.dart';

abstract class ColorUtils {
  static Color error(BuildContext context) =>
      Theme.of(context).colorScheme.error;
}
