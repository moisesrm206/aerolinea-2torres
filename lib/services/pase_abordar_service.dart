import 'package:aerolinea/dao/i_pase_abordar_dao.dart';
import 'package:aerolinea/dao/pase_abordar_dao_impl.dart';
import '../models/pase_abordar.dart';

/// Servicio de negocio para la entidad PaseAbordar.
/// Delega las operaciones de persistencia en un [IPaseAbordarDao].
class PaseAbordarService {
  final IPaseAbordarDao dao;

  PaseAbordarService({IPaseAbordarDao? dao})
      : dao = dao ?? PaseAbordarDaoImpl();

  Future<void> insertarPase(PaseAbordar pase) async {
    await dao.insertar(pase);
  }

  Future<void> actualizarPase(String id, PaseAbordar pase) async {
    await dao.actualizar(id, pase);
  }

  Future<void> eliminarPase(String id) async {
    await dao.eliminar(id);
  }

  Future<PaseAbordar?> obtenerPasePorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<PaseAbordar>> obtenerTodosLosPases() async {
    return await dao.obtenerTodos();
  }

  Stream<List<PaseAbordar>> obtenerTodosLosPasesStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<PaseAbordar>> obtenerPasesPorCampo(
      String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }
}
