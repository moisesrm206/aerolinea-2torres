import 'base_controller.dart';

/// Controlador para la pantalla de inicio del cliente.
/// Expone los métodos que los botones del home del cliente registrarán.
class HomeClienteController extends BaseController {
  String? _usuarioNombre;
  String? get usuarioNombre => _usuarioNombre;

  /// Método base para el botón de ver mis reservas.
  /// (Sin navegación entre vistas aún)
  void verMisReservas() {
    clearMessages();
    setSuccess('Mostrando mis reservas');
  }

  /// Método base para el botón de reservar vuelo.
  void reservarVuelo() {
    clearMessages();
    setSuccess('Abriendo formulario de reservación');
  }

  /// Método base para el botón de hacer check-in.
  void hacerCheckIn() {
    clearMessages();
    setSuccess('Abriendo formulario de check-in');
  }

  /// Método base para el botón de ver pase de abordar.
  void verPaseAbordar() {
    clearMessages();
    setSuccess('Mostrando pase de abordar');
  }

  /// Establece el nombre del usuario logueado.
  void setUsuarioNombre(String nombre) {
    _usuarioNombre = nombre;
    notifyListeners();
  }

  /// Método base para el botón de cerrar sesión.
  Future<void> cerrarSesion() async {
    setLoading(true);
    try {
      _usuarioNombre = null;
      setSuccess('Sesión cerrada');
    } catch (e) {
      setError('Error al cerrar sesión: $e');
    }
  }
}
