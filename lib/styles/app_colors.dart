import 'package:flutter/material.dart';

/// Colores centralizados de la aplicación Aerolíneas 2Torres.
/// Úsalos en lugar de escribir colores hardcodeados en cada pantalla.
class AppColors {
  // Colores principales (marca)
  static const Color primary = Color(0xFF0D47A1);      // Azul oscuro corporativo
  static const Color primaryDark = Color(0xFF0A3A88);
  static const Color secondary = Color(0xFF00ACC1);    // Cian secundario
  static const Color secondaryLight = Color(0xFF4DD0E1);

  // Superficies y fondo
  static const Color surface = Color(0xFFF4F6FA);      // Fondo general
  static const Color surfaceLight = Color(0xFFFFFFFF); // Tarjetas, modales
  static const Color surfaceDark = Color(0xFFE3EAF6);

  // Texto
  static const Color textPrimary = Color(0xFF1A1A2E);  // Casi negro
  static const Color textSecondary = Color(0xFF5A5F73); // Gris medio
  static const Color textHint = Color(0xFF9AA0B5);     // Placeholders
  static const Color textOnPrimary = Color(0xFFFFFFFF); // Texto sobre fondo primario

  // Estados
  static const Color success = Color(0xFF2E7D32);      // Verde
  static const Color warning = Color(0xFFF9A825);      // Ámbar
  static const Color error = Color(0xFFC62828);        // Rojo
  static const Color info = Color(0xFF1565C0);         // Azul informativo

  // Bordes y divisores
  static const Color border = Color(0xFFD9DEEA);
  static const Color divider = Color(0xFFEEF1F7);
}
