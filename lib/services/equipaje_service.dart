
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/equipaje.dart';

class EquipajeService {

  final CollectionReference<Map<String, dynamic>> equipajes =
  FirebaseFirestore.instance.collection('equipaje');

  Future<void> insertarEquipaje(Equipaje equipaje) async {

    await equipajes.doc(equipaje.idEquipaje).set(
      equipaje.toMap(),
    );

  }

}
