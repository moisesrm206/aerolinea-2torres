import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const Aerolinea2TorresApp());
}

class Aerolinea2TorresApp extends StatelessWidget {
  const Aerolinea2TorresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aerolíneas 2Torres',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1),
          primary: const Color(0xFF0D47A1),
          secondary: const Color(0xFF00ACC1),
          surface: const Color(0xFFF4F6FA),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D47A1),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}