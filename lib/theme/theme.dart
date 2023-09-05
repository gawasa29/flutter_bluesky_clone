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
    this.errorColor = const Color(0xFFBE2C46),
    this.backgroundColor = const Color(0xFFFFFFFF),
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color neutralColor;
  final Color errorColor;
  final Color backgroundColor;

  ColorScheme _scheme() {
    return ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      onSecondary: neutralColor,
      error: errorColor,
      background: backgroundColor,
    );
  }

  ThemeData _base(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1,
        ),
      ),
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
    Color? errorColor,
    Color? backgroundColor,
  }) =>
      BlueSkyTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
        errorColor: errorColor ?? this.errorColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
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
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
