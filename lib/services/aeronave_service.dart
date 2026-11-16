import 'package:aerolinea/dao/i_aeronave_dao.dart';
import 'package:aerolinea/dao/aeronave_dao_impl.dart';
import '../models/aeronave.dart';

/// Servicio de negocio para la entidad Aeronave.
/// Delega las operaciones de persistencia en un [IAeronaveDao].
class AeronaveService {
  final IAeronaveDao dao;

  AeronaveService({IAeronaveDao? dao}) : dao = dao ?? AeronaveDaoImpl();

  Future<void> insertarAeronave(Aeronave aeronave) async {
    await dao.insertar(aeronave);
  }

  Future<void> actualizarAeronave(String id, Aeronave aeronave) async {
    await dao.actualizar(id, aeronave);
  }

  Future<void> eliminarAeronave(String id) async {
    await dao.eliminar(id);
  }

  Future<Aeronave?> obtenerAeronavePorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<Aeronave>> obtenerTodasLasAeronaves() async {
    return await dao.obtenerTodos();
  }

  Stream<List<Aeronave>> obtenerTodasLasAeronavesStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<Aeronave>> obtenerAeronavesPorCampo(
      String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }
}

/*ej ...
* Future<void> registrar() async {
*
    Aeronave aeronave = Aeronave(
      idAeronave: 'AV001',
      modelo: 'Boeing 737',
      capacidadTotal: 180,
      estado: 'Disponible',
      configuracionCabina: {
        'clase_economica': 150,
        'clase_ejecutiva': 30,
      },
    );

    await servicio.insertarAeronave(aeronave);
  }*/
