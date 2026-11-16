import 'package:aerolinea/models/datos_cliente.dart';
import 'package:aerolinea/models/datos_empleado.dart';

class Usuario {
  final String uid;
  final String nombreCompleto;
  final String username;
  final String correo;
  final String telefono;
  final String rol;
  final bool activo;
  final DatosCliente? datosCliente;
  final DatosEmpleado? datosEmpleado;
  final String password;

  Usuario({
    required this.uid,
    required this.nombreCompleto,
    required this.username,
    required this.correo,
    required this.telefono,
    required this.rol,
    required this.activo,
    required this.password,
    this.datosCliente,
    this.datosEmpleado,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      uid: map['uid'] ?? '',
      nombreCompleto: map['nombre_completo'] ?? '',
      username: map['username'] ?? '',
      correo: map['correo'] ?? '',
      telefono: map['telefono'] ?? '',
      rol: map['rol'] ?? 'cliente',
      activo: map['activo'] ?? true,
      datosCliente: map['datos_cliente'] != null
          ? DatosCliente.fromMap(
              Map<String, dynamic>.from(map['datos_cliente']))
          : null,
      datosEmpleado: map['datos_empleado'] != null
          ? DatosEmpleado.fromMap(
              Map<String, dynamic>.from(map['datos_empleado']))
          : null,
      password: map['contraseña'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nombre_completo': nombreCompleto,
      'username': username,
      'correo': correo,
      'telefono': telefono,
      'rol': rol,
      'activo': activo,
      if (datosCliente != null) 'datos_cliente': datosCliente!.toMap(),
      if (datosEmpleado != null) 'datos_empleado': datosEmpleado!.toMap(),
      // 'contraseña': password,  // No se recomienda guardar la contraseña en Firestore
    };
  }
}
