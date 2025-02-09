import 'package:cats_app/presentation/utils/colors_utils.dart';
import 'package:cats_app/presentation/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Icon(
          Icons.error_outline_sharp,
          size: 48,
          color: ColorUtils.error(context),
        ),
        Text(
          'An error occurred',
          style: TextStyleUtils.headlineLarge(context),
        ),
        Text(
          message,
          style: TextStyleUtils.bodyLarge(context),
        ),
        SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: onRetry,
          label: const Text('Retry'),
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
