import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Estilos de botones centralizados.
class AppButtonStyles {
  /// Botón elevado principal (primario)
  static ButtonStyle elevatedPrimary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.textOnPrimary,
    elevation: 2,
    shadowColor: AppColors.primary.withOpacity(0.3),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: AppTextStyles.button.copyWith(fontSize: 14),
  );

  /// Botón elevado secundario
  static ButtonStyle elevatedSecondary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.textOnPrimary,
    elevation: 2,
    shadowColor: AppColors.secondary.withOpacity(0.3),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: AppTextStyles.button.copyWith(fontSize: 14),
  );

  /// Botón de contorno (outline)
  static ButtonStyle outlinedPrimary = OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    side: const BorderSide(color: AppColors.primary, width: 1.5),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: AppTextStyles.button.copyWith(fontSize: 14, color: AppColors.primary),
  );

  /// Botón de texto (text)
  static ButtonStyle textPrimary = TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
  );

  /// Botón de texto peligro/error
  static ButtonStyle textError = TextButton.styleFrom(
    foregroundColor: AppColors.error,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: AppTextStyles.labelLarge.copyWith(color: AppColors.error),
  );
}
