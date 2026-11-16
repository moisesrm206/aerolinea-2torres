import 'package:aerolinea/dao/i_vuelo_dao.dart';
import 'package:aerolinea/dao/vuelo_dao_impl.dart';
import '../models/vuelo.dart';

/// Servicio de negocio para la entidad Vuelo.
/// Delega las operaciones de persistencia en un [IVueloDao].
class VueloService {
  final IVueloDao dao;

  VueloService({IVueloDao? dao}) : dao = dao ?? VueloDaoImpl();

  Future<void> insertarVuelo(Vuelo vuelo) async {
    await dao.insertar(vuelo);
  }

  Future<void> actualizarVuelo(String id, Vuelo vuelo) async {
    await dao.actualizar(id, vuelo);
  }

  Future<void> eliminarVuelo(String id) async {
    await dao.eliminar(id);
  }

  Future<Vuelo?> obtenerVueloPorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<Vuelo>> obtenerTodosLosVuelos() async {
    return await dao.obtenerTodos();
  }

  Stream<List<Vuelo>> obtenerTodosLosVuelosStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<Vuelo>> obtenerVuelosPorCampo(String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }
}
