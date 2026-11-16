
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pase_abordar.dart';

class PaseAbordarService {

  final CollectionReference<Map<String, dynamic>> pases =
  FirebaseFirestore.instance.collection('pases_abordar');

  Future<void> insertarPase(PaseAbordar pase) async {

    await pases.doc(pase.idPase).set(
      pase.toMap(),
    );

  }

}
