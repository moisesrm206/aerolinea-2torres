import 'package:aerolinea/dao/i_nomina_turno_dao.dart';
import 'package:aerolinea/dao/nomina_turno_dao_impl.dart';
import '../models/nomina_turno.dart';

/// Servicio de negocio para la entidad NominaTurno.
/// Delega las operaciones de persistencia en un [INominaTurnoDao].
class NominaTurnoService {
  final INominaTurnoDao dao;

  NominaTurnoService({INominaTurnoDao? dao})
      : dao = dao ?? NominaTurnoDaoImpl();

  Future<void> insertarNomina(NominaTurno nomina) async {
    await dao.insertar(nomina);
  }

  Future<void> actualizarNomina(String id, NominaTurno nomina) async {
    await dao.actualizar(id, nomina);
  }

  Future<void> eliminarNomina(String id) async {
    await dao.eliminar(id);
  }

  Future<NominaTurno?> obtenerNominaPorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<NominaTurno>> obtenerTodasLasNominas() async {
    return await dao.obtenerTodos();
  }

  Stream<List<NominaTurno>> obtenerTodasLasNominasStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<NominaTurno>> obtenerNominasPorCampo(
      String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }
}
