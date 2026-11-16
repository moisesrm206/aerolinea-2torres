import 'package:aerolinea/services/nomina_turno_service.dart';
import 'package:aerolinea/models/nomina_turno.dart';
import 'base_controller.dart';

/// Controlador para la gestión de nómina y turnos.
/// Expone los métodos que los botones de la pantalla de nómina registrarán.
class NominaTurnoController extends BaseController {
  final NominaTurnoService _service;

  NominaTurnoController({NominaTurnoService? service})
      : _service = service ?? NominaTurnoService();

  List<NominaTurno> _nominas = [];
  NominaTurno? _nominaSeleccionada;

  List<NominaTurno> get nominas => _nominas;
  NominaTurno? get nominaSeleccionada => _nominaSeleccionada;

  /// Método base para el botón de insertar nómina.
  Future<void> insertarNomina(NominaTurno nomina) async {
    setLoading(true);
    try {
      await _service.insertarNomina(nomina);
      await obtenerTodasLasNominas();
      setSuccess('Registro de nómina insertado correctamente');
    } catch (e) {
      setError('Error al insertar nómina: $e');
    }
  }

  /// Método base para el botón de actualizar nómina.
  Future<void> actualizarNomina(String id, NominaTurno nomina) async {
    setLoading(true);
    try {
      await _service.actualizarNomina(id, nomina);
      await obtenerTodasLasNominas();
      setSuccess('Registro de nómina actualizado correctamente');
    } catch (e) {
      setError('Error al actualizar nómina: $e');
    }
  }

  /// Método base para el botón de eliminar nómina.
  Future<void> eliminarNomina(String id) async {
    setLoading(true);
    try {
      await _service.eliminarNomina(id);
      await obtenerTodasLasNominas();
      setSuccess('Registro de nómina eliminado correctamente');
    } catch (e) {
      setError('Error al eliminar nómina: $e');
    }
  }

  /// Método base para el botón de obtener / listar nómina.
  Future<void> obtenerTodasLasNominas() async {
    setLoading(true);
    try {
      _nominas = await _service.obtenerTodasLasNominas();
      setLoading(false);
    } catch (e) {
      setError('Error al cargar nómina: $e');
    }
  }

  /// Método base para el botón de seleccionar nómina.
  void seleccionarNomina(NominaTurno? nomina) {
    _nominaSeleccionada = nomina;
    notifyListeners();
  }

  /// Método base para el botón de limpiar selección / formulario.
  void limpiarSeleccion() {
    _nominaSeleccionada = null;
    clearMessages();
  }
}
