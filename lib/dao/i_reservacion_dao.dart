import '../models/reservacion.dart';

/// Interfaz DAO para la entidad Reservacion.
abstract class IReservacionDao {
  Future<void> insertar(Reservacion reservacion);
  Future<void> actualizar(String id, Reservacion reservacion);
  Future<void> eliminar(String id);
  Future<Reservacion?> obtenerPorId(String id);
  Future<List<Reservacion>> obtenerTodos();
  Stream<List<Reservacion>> obtenerTodosStream();
  Future<List<Reservacion>> obtenerPorCampo(String campo, dynamic valor);
}
