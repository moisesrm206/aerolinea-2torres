import 'package:aerolinea/dao/i_pago_dao.dart';
import 'package:aerolinea/dao/pago_dao_impl.dart';
import '../models/pago.dart';

/// Servicio de negocio para la entidad Pago.
/// Delega las operaciones de persistencia en un [IPagoDao].
class PagoService {
  final IPagoDao dao;

  PagoService({IPagoDao? dao}) : dao = dao ?? PagoDaoImpl();

  Future<void> insertarPago(Pago pago) async {
    await dao.insertar(pago);
  }

  Future<void> actualizarPago(String id, Pago pago) async {
    await dao.actualizar(id, pago);
  }

  Future<void> eliminarPago(String id) async {
    await dao.eliminar(id);
  }

  Future<Pago?> obtenerPagoPorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<Pago>> obtenerTodosLosPagos() async {
    return await dao.obtenerTodos();
  }

  Stream<List<Pago>> obtenerTodosLosPagosStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<Pago>> obtenerPagosPorCampo(String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }
}
