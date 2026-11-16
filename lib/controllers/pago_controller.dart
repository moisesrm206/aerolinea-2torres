import 'package:aerolinea/services/pago_service.dart';
import 'package:aerolinea/models/pago.dart';
import 'base_controller.dart';

/// Controlador para la gestión de pagos.
/// Expone los métodos que los botones de la pantalla de pagos registrarán.
class PagoController extends BaseController {
  final PagoService _service;

  PagoController({PagoService? service})
      : _service = service ?? PagoService();

  List<Pago> _pagos = [];
  Pago? _pagoSeleccionado;

  List<Pago> get pagos => _pagos;
  Pago? get pagoSeleccionado => _pagoSeleccionado;

  /// Método base para el botón de insertar pago.
  Future<void> insertarPago(Pago pago) async {
    setLoading(true);
    try {
      await _service.insertarPago(pago);
      await obtenerTodosLosPagos();
      setSuccess('Pago insertado correctamente');
    } catch (e) {
      setError('Error al insertar pago: $e');
    }
  }

  /// Método base para el botón de actualizar pago.
  Future<void> actualizarPago(String id, Pago pago) async {
    setLoading(true);
    try {
      await _service.actualizarPago(id, pago);
      await obtenerTodosLosPagos();
      setSuccess('Pago actualizado correctamente');
    } catch (e) {
      setError('Error al actualizar pago: $e');
    }
  }

  /// Método base para el botón de eliminar pago.
  Future<void> eliminarPago(String id) async {
    setLoading(true);
    try {
      await _service.eliminarPago(id);
      await obtenerTodosLosPagos();
      setSuccess('Pago eliminado correctamente');
    } catch (e) {
      setError('Error al eliminar pago: $e');
    }
  }

  /// Método base para el botón de obtener / listar pagos.
  Future<void> obtenerTodosLosPagos() async {
    setLoading(true);
    try {
      _pagos = await _service.obtenerTodosLosPagos();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar pagos: $e');
    }
  }

  /// Método base para el botón de seleccionar pago.
  void seleccionarPago(Pago? pago) {
    _pagoSeleccionado = pago;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _pagoSeleccionado = null;
    clearMessages();
  }
}
