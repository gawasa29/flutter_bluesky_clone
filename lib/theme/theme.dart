import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
AppTheme theme(ThemeRef ref) {
  return const AppTheme();
}

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
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
  ThemeExtension<AppTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? neutralColor,
    Color? errorColor,
    Color? backgroundColor,
  }) =>
      AppTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
        errorColor: errorColor ?? this.errorColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  AppTheme lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) return this;
    return AppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
