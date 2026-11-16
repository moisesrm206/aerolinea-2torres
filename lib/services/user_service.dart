import 'package:aerolinea/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//en este archivo se centralizan las operaciones con la base de datos*
class FirebaseService {
  final CollectionReference<Map<String, dynamic>> usuarios =
  FirebaseFirestore.instance.collection('usuarios');

  Future<void> insertarUsuario(Usuario usuario) async {

    await usuarios.doc(usuario.uid).set(
      usuario.toMap(),
    );

  }
/*
  final CollectionReference usuarios =
  FirebaseFirestore.instance.collection('usuarios');

  Future<void> guardarUsuario(
      String uid,
      String nombre,
      String userName,
      String correo,
      String telefono,
      String rol,
      bool activo,
      Map<String, dynamic> datosCliente,
      Map<String, dynamic> datosEmpleado,
      String password
      ) async {

    await usuarios.add({
      'uid':uid,
      'nombreCompleto': nombre,
      'username': userName,
      'correo': correo,
      'telefono':telefono,
      'rol':rol,
      'activo':activo,
      'datosCloiente':datosCliente,
      'datosEmpleado':datosEmpleado,
      'password':password
    });

  }*/
}