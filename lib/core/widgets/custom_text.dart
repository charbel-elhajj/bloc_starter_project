import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.data, {
    this.type = TextType.body,
    this.copyWith,
    super.key,
  });

  final String data;
  final TextType type;
  final TextStyle? copyWith;

  @override
  Widget build(BuildContext context) {
    final themeTextStyle = Theme.of(context).textTheme;
    final style = _retrieveStyle(themeTextStyle);

    return Text(data, style: style?.merge(copyWith));
  }

  TextStyle? _retrieveStyle(TextTheme textTheme) {
    switch (type) {
      case TextType.h1:
        return textTheme.displayLarge;
      case TextType.h2:
        return textTheme.displayMedium;
      case TextType.h3:
        return textTheme.displaySmall;
      case TextType.h4:
        return textTheme.headlineMedium;
      case TextType.h5:
        return textTheme.headlineSmall;
      case TextType.body:
        return textTheme.bodyLarge;
      case TextType.link:
        return textTheme.bodySmall;
    }
  }
}

enum TextType { h1, h2, h3, h4, h5, body, link }
