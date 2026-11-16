import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pase_abordar.dart';
import 'i_pase_abordar_dao.dart';

/// Implementación de [IPaseAbordarDao] usando Firebase Firestore.
class PaseAbordarDaoImpl implements IPaseAbordarDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('pases_abordar');

  @override
  Future<void> insertar(PaseAbordar pase) async {
    await _coleccion.doc(pase.idPase).set(pase.toMap());
  }

  @override
  Future<void> actualizar(String id, PaseAbordar pase) async {
    await _coleccion.doc(id).update(pase.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<PaseAbordar?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return PaseAbordar.fromMap(doc.data()!);
  }

  @override
  Future<List<PaseAbordar>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => PaseAbordar.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<PaseAbordar>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => PaseAbordar.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<PaseAbordar>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => PaseAbordar.fromMap(doc.data()))
        .toList();
  }
}
