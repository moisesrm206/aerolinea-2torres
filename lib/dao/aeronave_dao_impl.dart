import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/aeronave.dart';
import 'i_aeronave_dao.dart';

/// Implementación de [IAeronaveDao] usando Firebase Firestore.
class AeronaveDaoImpl implements IAeronaveDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('aeronaves');

  @override
  Future<void> insertar(Aeronave aeronave) async {
    await _coleccion.doc(aeronave.idAeronave).set(aeronave.toMap());
  }

  @override
  Future<void> actualizar(String id, Aeronave aeronave) async {
    await _coleccion.doc(id).update(aeronave.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<Aeronave?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return Aeronave.fromMap(doc.data()!);
  }

  @override
  Future<List<Aeronave>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => Aeronave.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<Aeronave>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Aeronave.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<Aeronave>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => Aeronave.fromMap(doc.data()))
        .toList();
  }
}
