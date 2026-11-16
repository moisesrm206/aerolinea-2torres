import '../models/equipaje.dart';

/// Interfaz DAO para la entidad Equipaje.
abstract class IEquipajeDao {
  Future<void> insertar(Equipaje equipaje);
  Future<void> actualizar(String id, Equipaje equipaje);
  Future<void> eliminar(String id);
  Future<Equipaje?> obtenerPorId(String id);
  Future<List<Equipaje>> obtenerTodos();
  Stream<List<Equipaje>> obtenerTodosStream();
  Future<List<Equipaje>> obtenerPorCampo(String campo, dynamic valor);
}
