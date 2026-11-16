import 'package:aerolinea/dao/i_usuario_dao.dart';
import 'package:aerolinea/dao/usuario_dao_impl.dart';
import 'package:aerolinea/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//en este archivo se centralizan las operaciones con la base de datos*
class FirebaseService {
  final IUsuarioDao dao;

  FirebaseService({IUsuarioDao? dao}) : dao = dao ?? UsuarioDaoImpl();

  final CollectionReference<Map<String, dynamic>> usuarios =
      FirebaseFirestore.instance.collection('usuarios');

  Future<void> insertarUsuario(Usuario usuario) async {
    await dao.insertar(usuario);
  }

  Future<void> actualizarUsuario(String id, Usuario usuario) async {
    await dao.actualizar(id, usuario);
  }

  Future<void> eliminarUsuario(String id) async {
    await dao.eliminar(id);
  }

  Future<Usuario?> obtenerUsuarioPorId(String id) async {
    return await dao.obtenerPorId(id);
  }

  Future<List<Usuario>> obtenerTodosLosUsuarios() async {
    return await dao.obtenerTodos();
  }

  Stream<List<Usuario>> obtenerTodosLosUsuariosStream() {
    return dao.obtenerTodosStream();
  }

  Future<List<Usuario>> obtenerUsuariosPorCampo(
      String campo, dynamic valor) async {
    return await dao.obtenerPorCampo(campo, valor);
  }

  /*
    final CollectionReference usuarios =
    FirebaseFirestore.instance.collection('usuarios');

    Future<void> guardarUsuario(
        String uid,
        String nombre,
        String userName,
        String correo,
        String telefono,
        String rol,
        bool activo,
        Map<String, dynamic> datosCliente,
        Map<String, dynamic> datosEmpleado,
        String password
        ) async {

      await usuarios.add({
        'uid':uid,
        'nombreCompleto': nombre,
        'username': userName,
        'correo': correo,
        'telefono':telefono,
        'rol':rol,
        'activo':activo,
        'datosCloiente':datosCliente,
        'datosEmpleado':datosEmpleado,
        'password':password
      });

    }*/
}
