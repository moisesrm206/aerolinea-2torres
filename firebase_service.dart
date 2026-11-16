import 'package:cloud_firestore/cloud_firestore.dart';
//en este archivo se centralizan las operaciones con la base de datos*
class FirebaseService {

  final CollectionReference usuarios =
  FirebaseFirestore.instance.collection('usuarios');

  Future<void> guardarUsuario(
      String nombre,
      String correo,
      int edad
      ) async {

    await usuarios.add({
      'nombre': nombre,
      'correo': correo,
      'edad': edad,
    });

  }
}