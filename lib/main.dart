import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'utils/theme.dart';

void main() {
  runApp(const QCoffeeApp());
}

class QCoffeeApp extends StatelessWidget {
  const QCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mutu Kopi Fuzzy",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
