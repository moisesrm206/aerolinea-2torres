import 'package:flutter/foundation.dart';

/// Clase base para todos los controladores de pantalla.
/// Proporciona estado de carga, manejo de errores y notificación a la UI.
abstract class BaseController extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  String? _successMessage;

  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get successMessage => _successMessage;

  /// Establece estado de carga y notifica.
  void setLoading(bool value) {
    _isLoading = value;
    _error = null;
    _successMessage = null;
    notifyListeners();
  }

  /// Establece un error y detiene la carga.
  void setError(String message) {
    _error = message;
    _isLoading = false;
    _successMessage = null;
    notifyListeners();
  }

  /// Establece un mensaje de éxito y detiene la carga.
  void setSuccess(String message) {
    _successMessage = message;
    _isLoading = false;
    _error = null;
    notifyListeners();
  }

  /// Limpia mensajes de error y éxito.
  void clearMessages() {
    _error = null;
    _successMessage = null;
    notifyListeners();
  }
}
