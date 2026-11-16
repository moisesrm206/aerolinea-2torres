import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/usuario.dart';
import 'i_usuario_dao.dart';

/// Implementación de [IUsuarioDao] usando Firebase Firestore.
class UsuarioDaoImpl implements IUsuarioDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('usuarios');

  @override
  Future<void> insertar(Usuario usuario) async {
    await _coleccion.doc(usuario.uid).set(usuario.toMap());
  }

  @override
  Future<void> actualizar(String id, Usuario usuario) async {
    await _coleccion.doc(id).update(usuario.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<Usuario?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return Usuario.fromMap(doc.data()!);
  }

  @override
  Future<List<Usuario>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => Usuario.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<Usuario>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Usuario.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<Usuario>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => Usuario.fromMap(doc.data()))
        .toList();
  }
}
