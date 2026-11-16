import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pago.dart';
import 'i_pago_dao.dart';

/// Implementación de [IPagoDao] usando Firebase Firestore.
class PagoDaoImpl implements IPagoDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('pagos');

  @override
  Future<void> insertar(Pago pago) async {
    await _coleccion.doc(pago.idPago).set(pago.toMap());
  }

  @override
  Future<void> actualizar(String id, Pago pago) async {
    await _coleccion.doc(id).update(pago.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<Pago?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return Pago.fromMap(doc.data()!);
  }

  @override
  Future<List<Pago>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => Pago.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<Pago>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Pago.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<Pago>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => Pago.fromMap(doc.data()))
        .toList();
  }
}
