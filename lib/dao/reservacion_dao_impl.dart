import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reservacion.dart';
import 'i_reservacion_dao.dart';

/// Implementación de [IReservacionDao] usando Firebase Firestore.
class ReservacionDaoImpl implements IReservacionDao {
  final CollectionReference<Map<String, dynamic>> _coleccion =
      FirebaseFirestore.instance.collection('reservaciones');

  @override
  Future<void> insertar(Reservacion reservacion) async {
    await _coleccion.doc(reservacion.idReservacion).set(reservacion.toMap());
  }

  @override
  Future<void> actualizar(String id, Reservacion reservacion) async {
    await _coleccion.doc(id).update(reservacion.toMap());
  }

  @override
  Future<void> eliminar(String id) async {
    await _coleccion.doc(id).delete();
  }

  @override
  Future<Reservacion?> obtenerPorId(String id) async {
    final doc = await _coleccion.doc(id).get();
    if (!doc.exists) return null;
    return Reservacion.fromMap(doc.data()!);
  }

  @override
  Future<List<Reservacion>> obtenerTodos() async {
    final snapshot = await _coleccion.get();
    return snapshot.docs
        .map((doc) => Reservacion.fromMap(doc.data()))
        .toList();
  }

  @override
  Stream<List<Reservacion>> obtenerTodosStream() {
    return _coleccion.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Reservacion.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  Future<List<Reservacion>> obtenerPorCampo(String campo, dynamic valor) async {
    final snapshot =
        await _coleccion.where(campo, isEqualTo: valor).get();
    return snapshot.docs
        .map((doc) => Reservacion.fromMap(doc.data()))
        .toList();
  }
}
