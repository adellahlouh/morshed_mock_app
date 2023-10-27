import 'package:flutter/material.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morshed Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
        useMaterial3: true,
        fontFamily: AppFonts.kFontFamily,
      ),
      home: const HomeScreen(),
    );
  }
}

