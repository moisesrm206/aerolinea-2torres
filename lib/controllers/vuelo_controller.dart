import 'package:aerolinea/services/vuelo_service.dart';
import 'package:aerolinea/models/vuelo.dart';
import 'base_controller.dart';

/// Controlador para la gestión de vuelos.
/// Expone los métodos que los botones de la pantalla de vuelos registrarán.
class VueloController extends BaseController {
  final VueloService _service;

  VueloController({VueloService? service})
      : _service = service ?? VueloService();

  List<Vuelo> _vuelos = [];
  Vuelo? _vueloSeleccionado;

  List<Vuelo> get vuelos => _vuelos;
  Vuelo? get vueloSeleccionado => _vueloSeleccionado;

  /// Método base para el botón de insertar vuelo.
  Future<void> insertarVuelo(Vuelo vuelo) async {
    setLoading(true);
    try {
      await _service.insertarVuelo(vuelo);
      await obtenerTodosLosVuelos();
      setSuccess('Vuelo insertado correctamente');
    } catch (e) {
      setError('Error al insertar vuelo: $e');
    }
  }

  /// Método base para el botón de actualizar vuelo.
  Future<void> actualizarVuelo(String id, Vuelo vuelo) async {
    setLoading(true);
    try {
      await _service.actualizarVuelo(id, vuelo);
      await obtenerTodosLosVuelos();
      setSuccess('Vuelo actualizado correctamente');
    } catch (e) {
      setError('Error al actualizar vuelo: $e');
    }
  }

  /// Método base para el botón de eliminar vuelo.
  Future<void> eliminarVuelo(String id) async {
    setLoading(true);
    try {
      await _service.eliminarVuelo(id);
      await obtenerTodosLosVuelos();
      setSuccess('Vuelo eliminado correctamente');
    } catch (e) {
      setError('Error al eliminar vuelo: $e');
    }
  }

  /// Método base para el botón de obtener / listar vuelos.
  Future<void> obtenerTodosLosVuelos() async {
    setLoading(true);
    try {
      _vuelos = await _service.obtenerTodosLosVuelos();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar vuelos: $e');
    }
  }

  /// Método base para el botón de seleccionar vuelo.
  void seleccionarVuelo(Vuelo? vuelo) {
    _vueloSeleccionado = vuelo;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _vueloSeleccionado = null;
    clearMessages();
  }
}
