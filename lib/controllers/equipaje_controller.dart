import 'package:aerolinea/services/equipaje_service.dart';
import 'package:aerolinea/models/equipaje.dart';
import 'base_controller.dart';

/// Controlador para la gestión de equipaje.
/// Expone los métodos que los botones de la pantalla de equipaje registrarán.
class EquipajeController extends BaseController {
  final EquipajeService _service;

  EquipajeController({EquipajeService? service})
      : _service = service ?? EquipajeService();

  List<Equipaje> _equipajes = [];
  Equipaje? _equipajeSeleccionado;

  List<Equipaje> get equipajes => _equipajes;
  Equipaje? get equipajeSeleccionado => _equipajeSeleccionado;

  /// Método base para el botón de insertar equipaje.
  Future<void> insertarEquipaje(Equipaje equipaje) async {
    setLoading(true);
    try {
      await _service.insertarEquipaje(equipaje);
      await obtenerTodosLosEquipajes();
      setSuccess('Equipaje insertado correctamente');
    } catch (e) {
      setError('Error al insertar equipaje: $e');
    }
  }

  /// Método base para el botón de actualizar equipaje.
  Future<void> actualizarEquipaje(String id, Equipaje equipaje) async {
    setLoading(true);
    try {
      await _service.actualizarEquipaje(id, equipaje);
      await obtenerTodosLosEquipajes();
      setSuccess('Equipaje actualizado correctamente');
    } catch (e) {
      setError('Error al actualizar equipaje: $e');
    }
  }

  /// Método base para el botón de eliminar equipaje.
  Future<void> eliminarEquipaje(String id) async {
    setLoading(true);
    try {
      await _service.eliminarEquipaje(id);
      await obtenerTodosLosEquipajes();
      setSuccess('Equipaje eliminado correctamente');
    } catch (e) {
      setError('Error al eliminar equipaje: $e');
    }
  }

  /// Método base para el botón de obtener / listar equipaje.
  Future<void> obtenerTodosLosEquipajes() async {
    setLoading(true);
    try {
      _equipajes = await _service.obtenerTodosLosEquipajes();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar equipaje: $e');
    }
  }

  /// Método base para el botón de seleccionar equipaje.
  void seleccionarEquipaje(Equipaje? equipaje) {
    _equipajeSeleccionado = equipaje;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _equipajeSeleccionado = null;
    clearMessages();
  }
}
