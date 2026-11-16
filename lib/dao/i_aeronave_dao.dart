import '../models/aeronave.dart';

/// Interfaz DAO para la entidad Aeronave.
abstract class IAeronaveDao {
  Future<void> insertar(Aeronave aeronave);
  Future<void> actualizar(String id, Aeronave aeronave);
  Future<void> eliminar(String id);
  Future<Aeronave?> obtenerPorId(String id);
  Future<List<Aeronave>> obtenerTodos();
  Stream<List<Aeronave>> obtenerTodosStream();
  Future<List<Aeronave>> obtenerPorCampo(String campo, dynamic valor);
}
