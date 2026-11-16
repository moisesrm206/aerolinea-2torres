
class Usuario {
  final String uid;
  final String nombreCompleto;
  final String username;
  final String correo;
  final String telefono;
  final String rol;
  final bool activo;
  final Map<String, dynamic> datosCliente;
  final Map<String, dynamic> datosEmpleado;
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
    Map<String, dynamic>? datosCliente,
    Map<String, dynamic>? datosEmpleado,
  })  : datosCliente = datosCliente ?? {},
        datosEmpleado = datosEmpleado ?? {};

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      uid: map['uid'] ?? '',
      nombreCompleto: map['nombre_completo'] ?? '',
      username: map['username'] ?? '',
      correo: map['correo'] ?? '',
      telefono: map['telefono'] ?? '',
      rol: map['rol'] ?? 'cliente',
      activo: map['activo'] ?? true,
      datosCliente: Map<String, dynamic>.from(
          map['datos_cliente'] ?? {}),
      datosEmpleado: Map<String, dynamic>.from(
          map['datos_empleado'] ?? {}),
        password: map['contraseña'] ?? ''
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
      'datos_cliente': datosCliente,
      'datos_empleado': datosEmpleado,
    };
  }
}
