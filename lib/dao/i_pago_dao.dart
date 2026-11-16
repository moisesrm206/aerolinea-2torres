import '../models/pago.dart';

/// Interfaz DAO para la entidad Pago.
abstract class IPagoDao {
  Future<void> insertar(Pago pago);
  Future<void> actualizar(String id, Pago pago);
  Future<void> eliminar(String id);
  Future<Pago?> obtenerPorId(String id);
  Future<List<Pago>> obtenerTodos();
  Stream<List<Pago>> obtenerTodosStream();
  Future<List<Pago>> obtenerPorCampo(String campo, dynamic valor);
}
