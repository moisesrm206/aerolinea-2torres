import '../models/nomina_turno.dart';

/// Interfaz DAO para la entidad NominaTurno.
abstract class INominaTurnoDao {
  Future<void> insertar(NominaTurno nomina);
  Future<void> actualizar(String id, NominaTurno nomina);
  Future<void> eliminar(String id);
  Future<NominaTurno?> obtenerPorId(String id);
  Future<List<NominaTurno>> obtenerTodos();
  Stream<List<NominaTurno>> obtenerTodosStream();
  Future<List<NominaTurno>> obtenerPorCampo(String campo, dynamic valor);
}
