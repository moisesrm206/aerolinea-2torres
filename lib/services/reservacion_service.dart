import 'package:aerolinea/dao/i_reservacion_dao.dart';
import 'package:aerolinea/dao/reservacion_dao_impl.dart';
import '../models/reservacion.dart';

/// Servicio de negocio para la entidad Reservacion.
/// Delega las operaciones de persistencia en un [IReservacionDao].
class ReservacionService {
  final IReservacionDao dao;

  ReservacionService({IReservacionDao? dao})
      : dao = dao ?? ReservacionDaoImpl();

  Future<void> insertarReservacion(Reservacion reservacion) async {
    await dao.insertar(reservacion);
  }

  Future<void> actualizarReservacion(String id, Reservacion reservacion) async {
    await dao.actualizar(id, reservacion);
  }

  Future<void> eliminarReservacion(String id) async {
    await dao.eliminar(id);
  }

  Future<Reservacion?> obtenerReservacionPorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<Reservacion>> obtenerTodasLasReservaciones() async {
    return await dao.obtenerTodos();
  }

  Stream<List<Reservacion>> obtenerTodasLasReservacionesStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<Reservacion>> obtenerReservacionesPorCampo(
      String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }
}
