import 'package:flutter/material.dart';
import 'package:bibliotheque_scolaire_csfm_library/screnns/login_screan.dart';
import 'package:bibliotheque_scolaire_csfm_library/style/style.dart';

void main() {
  runApp(const BiblioApp());
}

class BiblioApp extends StatelessWidget {
  const BiblioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiblioScolaire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: primaryColor,
          background: darkColor,
        ),
        scaffoldBackgroundColor: darkColor,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
