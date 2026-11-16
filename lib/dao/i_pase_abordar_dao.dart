import '../models/pase_abordar.dart';

/// Interfaz DAO para la entidad PaseAbordar.
abstract class IPaseAbordarDao {
  Future<void> insertar(PaseAbordar pase);
  Future<void> actualizar(String id, PaseAbordar pase);
  Future<void> eliminar(String id);
  Future<PaseAbordar?> obtenerPorId(String id);
  Future<List<PaseAbordar>> obtenerTodos();
  Stream<List<PaseAbordar>> obtenerTodosStream();
  Future<List<PaseAbordar>> obtenerPorCampo(String campo, dynamic valor);
}
