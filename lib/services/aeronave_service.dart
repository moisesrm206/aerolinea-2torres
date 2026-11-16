
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/aeronave.dart';

class AeronaveService {

  final CollectionReference<Map<String, dynamic>> aeronaves =
  FirebaseFirestore.instance.collection('aeronaves');

  Future<void> insertarAeronave(Aeronave aeronave) async {

    await aeronaves.doc(aeronave.idAeronave).set(
      aeronave.toMap(),
    );

  }

}
/*ej ...
*  Future<void> registrar() async {

    Aeronave aeronave = Aeronave(
      idAeronave: 'AV001',
      modelo: 'Boeing 737',
      capacidadTotal: 180,
      estado: 'Disponible',
      configuracionCabina: {
        'clase_economica': 150,
        'clase_ejecutiva': 30,
      },
    );

    await servicio.insertarAeronave(aeronave);
  }*/