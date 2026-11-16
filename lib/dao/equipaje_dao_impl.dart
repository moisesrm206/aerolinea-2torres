import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/equipaje.dart';
import 'i_equipaje_dao.dart';

/// Implementación de [IEquipajeDao] usando Firebase Firestore.
class EquipajeDaoImpl implements IEquipajeDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('equipaje');

  @override
  Future<void> insertar(Equipaje equipaje) async {
    await _coleccion.doc(equipaje.idEquipaje).set(equipaje.toMap());
  }

  @override
  Future<void> actualizar(String id, Equipaje equipaje) async {
    await _coleccion.doc(id).update(equipaje.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<Equipaje?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return Equipaje.fromMap(doc.data()!);
  }

  @override
  Future<List<Equipaje>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => Equipaje.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<Equipaje>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Equipaje.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<Equipaje>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => Equipaje.fromMap(doc.data()))
        .toList();
  }
}
