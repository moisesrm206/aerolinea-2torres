import '../models/usuario.dart';

/// Interfaz DAO para la entidad Usuario.
abstract class IUsuarioDao {
  Future<void> insertar(Usuario usuario);
  Future<void> actualizar(String id, Usuario usuario);
  Future<void> eliminar(String id);
  Future<Usuario?> obtenerPorId(String id);
  Future<List<Usuario>> obtenerTodos();
  Stream<List<Usuario>> obtenerTodosStream();
  Future<List<Usuario>> obtenerPorCampo(String campo, dynamic valor);
}
