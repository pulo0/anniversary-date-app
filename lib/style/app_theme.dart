import 'package:flutter/material.dart';

ColorScheme get colorScheme => ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 67, 35, 65),
);

ThemeData mainTheme() => ThemeData.from(
      colorScheme: colorScheme,
    );
