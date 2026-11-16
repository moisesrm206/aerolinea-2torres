import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/vuelo.dart';
import 'i_vuelo_dao.dart';

/// Implementación de [IVueloDao] usando Firebase Firestore.
class VueloDaoImpl implements IVueloDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('vuelos');

  @override
  Future<void> insertar(Vuelo vuelo) async {
    await _coleccion.doc(vuelo.idVuelo).set(vuelo.toMap());
  }

  @override
  Future<void> actualizar(String id, Vuelo vuelo) async {
    await _coleccion.doc(id).update(vuelo.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<Vuelo?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return Vuelo.fromMap(doc.data()!);
  }

  @override
  Future<List<Vuelo>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => Vuelo.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<Vuelo>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Vuelo.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<Vuelo>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => Vuelo.fromMap(doc.data()))
        .toList();
  }
}
