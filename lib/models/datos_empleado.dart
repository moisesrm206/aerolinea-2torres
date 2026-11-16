/// Datos específicos del empleado, embebidos dentro del documento de Usuario
/// en la colección `usuarios` de Firestore bajo la clave `datos_empleado`.
class DatosEmpleado {
  final String? numeroEmpleado;
  final String? puesto;
  final String? departamento;
  final DateTime? fechaIngreso;
  final double? salarioBase;
  final String? turno;

  DatosEmpleado({
    this.numeroEmpleado,
    this.puesto,
    this.departamento,
    this.fechaIngreso,
    this.salarioBase,
    this.turno,
  });

  factory DatosEmpleado.fromMap(Map<String, dynamic> map) {
    return DatosEmpleado(
      numeroEmpleado: map['numero_empleado'],
      puesto: map['puesto'],
      departamento: map['departamento'],
      fechaIngreso: map['fecha_ingreso'] is DateTime
          ? map['fecha_ingreso']
          : (map['fecha_ingreso'] != null
              ? DateTime.tryParse(map['fecha_ingreso'].toString())
              : null),
      salarioBase: map['salario_base'] is num
          ? (map['salario_base'] as num).toDouble()
          : null,
      turno: map['turno'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (numeroEmpleado != null) 'numero_empleado': numeroEmpleado,
      if (puesto != null) 'puesto': puesto,
      if (departamento != null) 'departamento': departamento,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (salarioBase != null) 'salario_base': salarioBase,
      if (turno != null) 'turno': turno,
    };
  }
}
