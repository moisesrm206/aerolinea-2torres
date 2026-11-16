import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reservacion.dart';

class ReservacionService {

  final CollectionReference<Map<String, dynamic>> reservaciones =
  FirebaseFirestore.instance.collection('reservaciones');

  Future<void> insertarReservacion(Reservacion reservacion) async {

    await reservaciones.doc(reservacion.idReservacion).set(
      reservacion.toMap(),
    );

  }

}
