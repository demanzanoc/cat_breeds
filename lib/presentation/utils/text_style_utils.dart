import 'package:flutter/material.dart';

abstract class TextStyleUtils {
  static TextStyle? boldBodyLarge(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyLarge
      ?.copyWith(fontWeight: FontWeight.bold);

  static TextStyle? bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;

  static headingLarge(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge;

  static headlineSmall(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall;
}
