import 'package:aerolinea/screens/auth/login_screen.dart';
import 'package:aerolinea/styles/app_theme.dart';
import 'package:aerolinea/styles/dark/dark_theme.dart';
import 'package:flutter/material.dart'; 
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Aerolinea2TorresApp());
}

class Aerolinea2TorresApp extends StatelessWidget {
  const Aerolinea2TorresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aerolíneas 2Torres',
      theme: appTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,

      // Pantalla inicial
      home: const LoginScreen(),
    );
  }
}
