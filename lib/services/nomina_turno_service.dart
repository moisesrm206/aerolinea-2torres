
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/nomina_turno.dart';

class NominaTurnoService {

  final CollectionReference<Map<String, dynamic>> nominas =
  FirebaseFirestore.instance.collection('nomina_turnos');

  Future<void> insertarNomina(NominaTurno nomina) async {

    await nominas.doc(nomina.idRegistro).set(
      nomina.toMap(),
    );

  }

}
