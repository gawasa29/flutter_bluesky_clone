import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider<BlueSkyTheme>((ref) {
  return const BlueSkyTheme();
});

@immutable
class BlueSkyTheme extends ThemeExtension<BlueSkyTheme> {
  const BlueSkyTheme({
    this.primaryColor = const Color(0xFF0085FF),
    this.secondaryColor = const Color(0xFFF3F3F8),
    this.neutralColor = const Color(0xFF545664),
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color neutralColor;
  ColorScheme _scheme() {
    return ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      onSecondary: neutralColor,
    );
  }

  ThemeData _base(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData toThemeData() {
    final colorScheme = _scheme();
    return _base(colorScheme);
  }

  @override
  ThemeExtension<BlueSkyTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? neutralColor,
  }) =>
      BlueSkyTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  BlueSkyTheme lerp(
    covariant ThemeExtension<BlueSkyTheme>? other,
    double t,
  ) {
    if (other is! BlueSkyTheme) return this;
    return BlueSkyTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }
}
