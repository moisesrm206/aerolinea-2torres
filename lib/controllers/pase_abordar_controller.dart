import 'package:aerolinea/services/pase_abordar_service.dart';
import 'package:aerolinea/models/pase_abordar.dart';
import 'base_controller.dart';

/// Controlador para la gestión de pases de abordar.
/// Expone los métodos que los botones de la pantalla de pases de abordar registrarán.
class PaseAbordarController extends BaseController {
  final PaseAbordarService _service;

  PaseAbordarController({PaseAbordarService? service})
      : _service = service ?? PaseAbordarService();

  List<PaseAbordar> _pases = [];
  PaseAbordar? _paseSeleccionado;

  List<PaseAbordar> get pases => _pases;
  PaseAbordar? get paseSeleccionado => _paseSeleccionado;

  /// Método base para el botón de insertar pase de abordar.
  Future<void> insertarPase(PaseAbordar pase) async {
    setLoading(true);
    try {
      await _service.insertarPase(pase);
      await obtenerTodosLosPases();
      setSuccess('Pase de abordar insertado correctamente');
    } catch (e) {
      setError('Error al insertar pase de abordar: $e');
    }
  }

  /// Método base para el botón de actualizar pase de abordar.
  Future<void> actualizarPase(String id, PaseAbordar pase) async {
    setLoading(true);
    try {
      await _service.actualizarPase(id, pase);
      await obtenerTodosLosPases();
      setSuccess('Pase de abordar actualizado correctamente');
    } catch (e) {
      setError('Error al actualizar pase de abordar: $e');
    }
  }

  /// Método base para el botón de eliminar pase de abordar.
  Future<void> eliminarPase(String id) async {
    setLoading(true);
    try {
      await _service.eliminarPase(id);
      await obtenerTodosLosPases();
      setSuccess('Pase de abordar eliminado correctamente');
    } catch (e) {
      setError('Error al eliminar pase de abordar: $e');
    }
  }

  /// Método base para el botón de obtener / listar pases de abordar.
  Future<void> obtenerTodosLosPases() async {
    setLoading(true);
    try {
      _pases = await _service.obtenerTodosLosPases();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar pases de abordar: $e');
    }
  }

  /// Método base para el botón de seleccionar pase de abordar.
  void seleccionarPase(PaseAbordar? pase) {
    _paseSeleccionado = pase;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _paseSeleccionado = null;
    clearMessages();
  }
}
