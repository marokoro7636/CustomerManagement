import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:customer_management/ui/theme/color.dart';

const ColorScheme darkColor = ColorScheme.dark(
  primary: blue80,
  onPrimary: blue20,
  primaryContainer: blue30,
  onPrimaryContainer: blue90,
  inversePrimary: blue40,
  secondary: jade80,
  onSecondary: jade20,
  secondaryContainer: jade30,
  onSecondaryContainer: jade90,
  tertiary: nadeshiko80,
  onTertiary: nadeshiko20,
  tertiaryContainer: nadeshiko30,
  onTertiaryContainer: nadeshiko90,
  error: red80,
  onError: red20,
  errorContainer: red30,
  onErrorContainer: red90,
  background: gray10,
  onBackground: gray90,
  surface: gray10,
  onSurface: gray90,
  inverseSurface: gray90,
  onInverseSurface: gray20,
  surfaceVariant: grayVariant30,
  onSurfaceVariant: grayVariant80,
  outline: grayVariant60,
);

const ColorScheme lightColor = ColorScheme.light(
  primary: blue40,
  onPrimary: Colors.white,
  primaryContainer: blue90,
  onPrimaryContainer: blue10,
  inversePrimary: blue80,
  secondary: jade40,
  onSecondary: Colors.white,
  secondaryContainer: jade90,
  onSecondaryContainer: jade10,
  tertiary: nadeshiko40,
  onTertiary: Colors.white,
  tertiaryContainer: nadeshiko90,
  onTertiaryContainer: nadeshiko10,
  error: red40,
  onError: Colors.white,
  errorContainer: red90,
  onErrorContainer: red10,
  background: gray99,
  onBackground: gray10,
  surface: gray99,
  onSurface: gray10,
  inverseSurface: gray20,
  onInverseSurface: gray95,
  surfaceVariant: grayVariant90,
  onSurfaceVariant: grayVariant30,
  outline: grayVariant50,
);

ThemeData _lightTheme = ThemeData.from(
  colorScheme: lightColor,
  useMaterial3: true,
);

ThemeData lightTheme = _lightTheme.copyWith(
  textTheme: GoogleFonts.mPlusRounded1cTextTheme(_lightTheme.textTheme),
  splashFactory: NoSplash.splashFactory,
);

ThemeData _darkTheme = ThemeData.from(
  colorScheme: darkColor,
  useMaterial3: true,
);

ThemeData darkTheme = _darkTheme.copyWith(
  textTheme: GoogleFonts.mPlusRounded1cTextTheme(_darkTheme.textTheme),
  splashFactory: NoSplash.splashFactory,
);
