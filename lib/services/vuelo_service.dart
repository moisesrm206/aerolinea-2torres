
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/vuelo.dart';

class VueloService {

  final CollectionReference<Map<String, dynamic>> vuelos =
  FirebaseFirestore.instance.collection('vuelos');

  Future<void> insertarVuelo(Vuelo vuelo) async {

    await vuelos.doc(vuelo.idVuelo).set(
      vuelo.toMap(),
    );

  }

}
