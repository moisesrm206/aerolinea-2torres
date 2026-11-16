import 'package:aerolinea/services/reservacion_service.dart';
import 'package:aerolinea/models/reservacion.dart';
import 'base_controller.dart';

/// Controlador para la gestión de reservaciones.
/// Expone los métodos que los botones de la pantalla de reservaciones registrarán.
class ReservacionController extends BaseController {
  final ReservacionService _service;

  ReservacionController({ReservacionService? service})
      : _service = service ?? ReservacionService();

  List<Reservacion> _reservaciones = [];
  Reservacion? _reservacionSeleccionada;

  List<Reservacion> get reservaciones => _reservaciones;
  Reservacion? get reservacionSeleccionada => _reservacionSeleccionada;

  /// Método base para el botón de insertar reservación.
  Future<void> insertarReservacion(Reservacion reservacion) async {
    setLoading(true);
    try {
      await _service.insertarReservacion(reservacion);
      await obtenerTodasLasReservaciones();
      setSuccess('Reservación insertada correctamente');
    } catch (e) {
      setError('Error al insertar reservación: $e');
    }
  }

  /// Método base para el botón de actualizar reservación.
  Future<void> actualizarReservacion(
      String id, Reservacion reservacion) async {
    setLoading(true);
    try {
      await _service.actualizarReservacion(id, reservacion);
      await obtenerTodasLasReservaciones();
      setSuccess('Reservación actualizada correctamente');
    } catch (e) {
      setError('Error al actualizar reservación: $e');
    }
  }

  /// Método base para el botón de eliminar reservación.
  Future<void> eliminarReservacion(String id) async {
    setLoading(true);
    try {
      await _service.eliminarReservacion(id);
      await obtenerTodasLasReservaciones();
      setSuccess('Reservación eliminada correctamente');
    } catch (e) {
      setError('Error al eliminar reservación: $e');
    }
  }

  /// Método base para el botón de obtener / listar reservaciones.
  Future<void> obtenerTodasLasReservaciones() async {
    setLoading(true);
    try {
      _reservaciones = await _service.obtenerTodasLasReservaciones();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar reservaciones: $e');
    }
  }

  /// Método base para el botón de seleccionar reservación.
  void seleccionarReservacion(Reservacion? reservacion) {
    _reservacionSeleccionada = reservacion;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _reservacionSeleccionada = null;
    clearMessages();
  }
}
