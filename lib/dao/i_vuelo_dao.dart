import '../models/vuelo.dart';

/// Interfaz DAO para la entidad Vuelo.
abstract class IVueloDao {
  Future<void> insertar(Vuelo vuelo);
  Future<void> actualizar(String id, Vuelo vuelo);
  Future<void> eliminar(String id);
  Future<Vuelo?> obtenerPorId(String id);
  Future<List<Vuelo>> obtenerTodos();
  Stream<List<Vuelo>> obtenerTodosStream();
  Future<List<Vuelo>> obtenerPorCampo(String campo, dynamic valor);
}
