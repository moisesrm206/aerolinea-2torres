import 'package:aerolinea/services/user_service.dart';
import 'package:aerolinea/models/usuario.dart';
import 'base_controller.dart';

/// Controlador para la pantalla de inicio de sesión.
/// Expone los métodos que los botones de login registrarán.
class LoginController extends BaseController {
  final FirebaseService _authService;

  LoginController({FirebaseService? authService})
      : _authService = authService ?? FirebaseService();

  Usuario? _usuario;
  Usuario? get usuario => _usuario;

  /// Método base para el botón de iniciar sesión.
  /// Aquí iría la validación de credenciales y la llamada a Firebase Auth.
  Future<void> iniciarSesion({
    required String correo,
    required String password,
  }) async {
    setLoading(true);
    try {
      // TODO: integrar con FirebaseAuth.signInWithEmailAndPassword
      // Por ahora se queda como estructura base sin navegación entre vistas.
      _usuario = Usuario(
        uid: '',
        nombreCompleto: '',
        username: '',
        correo: correo,
        telefono: '',
        rol: 'cliente',
        activo: true,
        password: password,
      );
      setSuccess('Inicio de sesión exitoso');
    } catch (e) {
      setError('Error al iniciar sesión: $e');
    }
  }

  /// Método base para el botón de registrar usuario.
  Future<void> registrarUsuario(Usuario usuario) async {
    setLoading(true);
    try {
      await _authService.insertarUsuario(usuario);
      _usuario = usuario;
      setSuccess('Usuario registrado correctamente');
    } catch (e) {
      setError('Error al registrar usuario: $e');
    }
  }

  /// Método base para el botón de limpiar formulario.
  void limpiarFormulario() {
    _usuario = null;
    clearMessages();
  }
}
