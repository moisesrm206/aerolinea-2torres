import 'package:aerolinea/services/user_service.dart';
import 'package:aerolinea/models/usuario.dart';
import 'base_controller.dart';

/// Controlador para la gestión de usuarios.
/// Expone los métodos que los botones de la pantalla de usuarios registrarán.
class UsuarioController extends BaseController {
  final FirebaseService _service;

  UsuarioController({FirebaseService? service})
      : _service = service ?? FirebaseService();

  List<Usuario> _usuarios = [];
  Usuario? _usuarioSeleccionado;

  List<Usuario> get usuarios => _usuarios;
  Usuario? get usuarioSeleccionado => _usuarioSeleccionado;

  /// Método base para el botón de insertar usuario.
  Future<void> insertarUsuario(Usuario usuario) async {
    setLoading(true);
    try {
      await _service.insertarUsuario(usuario);
      await obtenerTodosLosUsuarios();
      setSuccess('Usuario insertado correctamente');
    } catch (e) {
      setError('Error al insertar usuario: $e');
    }
  }

  /// Método base para el botón de actualizar usuario.
  Future<void> actualizarUsuario(String id, Usuario usuario) async {
    setLoading(true);
    try {
      await _service.actualizarUsuario(id, usuario);
      await obtenerTodosLosUsuarios();
      setSuccess('Usuario actualizado correctamente');
    } catch (e) {
      setError('Error al actualizar usuario: $e');
    }
  }

  /// Método base para el botón de eliminar usuario.
  Future<void> eliminarUsuario(String id) async {
    setLoading(true);
    try {
      await _service.eliminarUsuario(id);
      await obtenerTodosLosUsuarios();
      setSuccess('Usuario eliminado correctamente');
    } catch (e) {
      setError('Error al eliminar usuario: $e');
    }
  }

  /// Método base para el botón de obtener / listar usuarios.
  Future<void> obtenerTodosLosUsuarios() async {
    setLoading(true);
    try {
      _usuarios = await _service.obtenerTodosLosUsuarios();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar usuarios: $e');
    }
  }

  /// Método base para el botón de seleccionar usuario.
  void seleccionarUsuario(Usuario? usuario) {
    _usuarioSeleccionado = usuario;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _usuarioSeleccionado = null;
    clearMessages();
  }
}
