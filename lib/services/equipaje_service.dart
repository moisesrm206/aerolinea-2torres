import 'package:aerolinea/dao/i_equipaje_dao.dart';
import 'package:aerolinea/dao/equipaje_dao_impl.dart';
import '../models/equipaje.dart';

/// Servicio de negocio para la entidad Equipaje.
/// Delega las operaciones de persistencia en un [IEquipajeDao].
class EquipajeService {
  final IEquipajeDao dao;

  EquipajeService({IEquipajeDao? dao}) : dao = dao ?? EquipajeDaoImpl();

  Future<void> insertarEquipaje(Equipaje equipaje) async {
    await dao.insertar(equipaje);
  }

  Future<void> actualizarEquipaje(String id, Equipaje equipaje) async {
    await dao.actualizar(id, equipaje);
  }

  Future<void> eliminarEquipaje(String id) async {
    await dao.eliminar(id);
  }

  Future<Equipaje?> obtenerEquipajePorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<Equipaje>> obtenerTodosLosEquipajes() async {
    return await dao.obtenerTodos();
  }

  Stream<List<Equipaje>> obtenerTodosLosEquipajesStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<Equipaje>> obtenerEquipajesPorCampo(
      String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }
}
