import 'package:aerolinea/services/aeronave_service.dart';
import 'package:aerolinea/models/aeronave.dart';
import 'base_controller.dart';

/// Controlador para la gestión de aeronaves.
/// Expone los métodos que los botones de la pantalla de aeronaves registrarán.
class AeronaveController extends BaseController {
  final AeronaveService _service;

  AeronaveController({AeronaveService? service})
      : _service = service ?? AeronaveService();

  List<Aeronave> _aeronaves = [];
  Aeronave? _aeronaveSeleccionada;

  List<Aeronave> get aeronaves => _aeronaves;
  Aeronave? get aeronaveSeleccionada => _aeronaveSeleccionada;

  /// Método base para el botón de insertar aeronave.
  Future<void> insertarAeronave(Aeronave aeronave) async {
    setLoading(true);
    try {
      await _service.insertarAeronave(aeronave);
      await obtenerTodasLasAeronaves();
      setSuccess('Aeronave insertada correctamente');
    } catch (e) {
      setError('Error al insertar aeronave: $e');
    }
  }

  /// Método base para el botón de actualizar aeronave.
  Future<void> actualizarAeronave(String id, Aeronave aeronave) async {
    setLoading(true);
    try {
      await _service.actualizarAeronave(id, aeronave);
      await obtenerTodasLasAeronaves();
      setSuccess('Aeronave actualizada correctamente');
    } catch (e) {
      setError('Error al actualizar aeronave: $e');
    }
  }

  /// Método base para el botón de eliminar aeronave.
  Future<void> eliminarAeronave(String id) async {
    setLoading(true);
    try {
      await _service.eliminarAeronave(id);
      await obtenerTodasLasAeronaves();
      setSuccess('Aeronave eliminada correctamente');
    } catch (e) {
      setError('Error al eliminar aeronave: $e');
    }
  }

  /// Método base para el botón de obtener / listar aeronaves.
  Future<void> obtenerTodasLasAeronaves() async {
    setLoading(true);
    try {
      _aeronaves = await _service.obtenerTodasLasAeronaves();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar aeronaves: $e');
    }
  }

  /// Método base para el botón de seleccionar aeronave.
  void seleccionarAeronave(Aeronave? aeronave) {
    _aeronaveSeleccionada = aeronave;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _aeronaveSeleccionada = null;
    clearMessages();
  }
}
