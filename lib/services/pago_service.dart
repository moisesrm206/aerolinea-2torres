
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pago.dart';

class PagoService {

  final CollectionReference<Map<String, dynamic>> pagos =
  FirebaseFirestore.instance.collection('pagos');

  Future<void> insertarPago(Pago pago) async {

    await pagos.doc(pago.idPago).set(
      pago.toMap(),
    );

  }

}
