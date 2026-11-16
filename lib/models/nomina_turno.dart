
class NominaTurno {
  final String idRegistro;
  final String idEmpleado;
  final DateTime fecha;
  final String horaEntrada;
  final String horaSalida;
  final double horasTrabajadas;
  final double montoPagado;
  final String estadoPago;

  NominaTurno({
    required this.idRegistro,
    required this.idEmpleado,
    required this.fecha,
    required this.horaEntrada,
    required this.horaSalida,
    required this.horasTrabajadas,
    required this.montoPagado,
    required this.estadoPago,
  });

  factory NominaTurno.fromMap(Map<String, dynamic> map) {
    return NominaTurno(
      idRegistro: map['id_registro'] ?? '',
      idEmpleado: map['id_empleado'] ?? '',
      fecha: map['fecha'] is DateTime
          ? map['fecha']
          : (map['fecha'] as dynamic).toDate(),
      horaEntrada: map['hora_entrada'] ?? '',
      horaSalida: map['hora_salida'] ?? '',
      horasTrabajadas: (map['horas_trabajadas'] ?? 0).toDouble(),
      montoPagado: (map['monto_pagado'] ?? 0).toDouble(),
      estadoPago: map['estado_pago'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_registro': idRegistro,
      'id_empleado': idEmpleado,
      'fecha': fecha,
      'hora_entrada': horaEntrada,
      'hora_salida': horaSalida,
      'horas_trabajadas': horasTrabajadas,
      'monto_pagado': montoPagado,
      'estado_pago': estadoPago,
    };
  }
}
