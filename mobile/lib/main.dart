import 'package:flutter/material.dart';
import 'package:stairsbank/core/presentation/pages/login/login_page.dart';
import 'package:stairsbank/core/presentation/theme/theme_colors.dart';
import 'package:stairsbank/core/shared/constants/font_family_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StairsBank',
      theme: ThemeData(
        fontFamily: FontFamilyConstants.poppins,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColors.primary,
        ).copyWith(
          primary: ThemeColors.primary,
          secondary: ThemeColors.secondary,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
