import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/nomina_turno.dart';
import 'i_nomina_turno_dao.dart';

/// Implementación de [INominaTurnoDao] usando Firebase Firestore.
class NominaTurnoDaoImpl implements INominaTurnoDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('nomina_turnos');

  @override
  Future<void> insertar(NominaTurno nomina) async {
    await _coleccion.doc(nomina.idRegistro).set(nomina.toMap());
  }

  @override
  Future<void> actualizar(String id, NominaTurno nomina) async {
    await _coleccion.doc(id).update(nomina.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<NominaTurno?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return NominaTurno.fromMap(doc.data()!);
  }

  @override
  Future<List<NominaTurno>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => NominaTurno.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<NominaTurno>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => NominaTurno.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<NominaTurno>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => NominaTurno.fromMap(doc.data()))
        .toList();
  }
}
